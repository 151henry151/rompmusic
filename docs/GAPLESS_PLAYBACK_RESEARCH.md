# Gapless Playback: Research & Considerations

## How Apple Music Does It

- **Technology:** HLS (HTTP Live Streaming) + **AVQueuePlayer** (Apple).
- **Mechanism:** Multiple HLS-backed media items are **queued** in a single player. The system stitches them and transitions between items without audible gaps, clicks, or buffering.
- **Requirements:** Media authored for gapless HLS; queue has more than the currently playing item; next item is pre-loaded.
- **User-facing:** Apple Music analyzes tracks for “gapless playback information” in the background so albums that are meant to flow (e.g. Abbey Road) play seamlessly.

**Takeaway:** True “perfect” gapless on Apple is achieved by **queueing segments in one playback pipeline** (HLS + AVQueuePlayer), not by swapping two separate players.

---

## Why Gaps Happen (General)

### 1. Codec / file-level

- **MP3 / AAC** use overlapping transforms (e.g. MDCT) and add **padding** at start and end of each file (encoder delay, frame alignment).
- **MP3:** e.g. LAME adds ~576 padding samples; metadata (e.g. Xing/LAME) can carry gapless info.
- **AAC:** Common delay ~2112 samples; **iTunSMPB** / MPEG edit lists store delay and length so decoders can trim.
- If this padding isn’t trimmed at boundaries, you hear silence/glitches between tracks.

### 2. Playback / system-level

- **Two separate players:** Stopping one and starting another almost always causes a gap (teardown/setup, buffer refill).
- **Single output buffer:** Must be fed **continuously**. Any moment when nothing is feeding it = gap.
- **Delays:** Decode, buffer, and hardware latency can add up (often tens to hundreds of ms). The next track must be **decoded and ready before** the current one ends.

### 3. Web / HTML5

- **HTMLMediaElement:** One element per URL; no native “queue” of segments. Switching = load new URL → gap while loading/buffering.
- **Media Source Extensions (MSE):** Can achieve gapless by appending segments into a `SourceBuffer` and using **append window + timestamp offset** to strip encoder padding and form one continuous timeline. Production-quality gapless on web usually needs MSE (or similar control).
- **Web Audio API:** Can schedule buffers precisely but timing/GC and buffer duration quirks make perfect gapless non-trivial without careful design.

---

## What “Perfect” Gapless Would Require (Ideal)

| Layer            | Consideration |
|------------------|----------------|
| **Content**      | Gapless-aware encoding (or metadata) so encoder padding/delay is known and can be trimmed. |
| **Delivery**     | Either single continuous stream (e.g. HLS with gapless transitions) or segment queue (MSE) so the engine never runs out of data. |
| **Playback**     | One logical pipeline (queue or MSE) so the output buffer is never starved; next segment decoded and ready before current ends. |
| **Timing**       | Transition triggered so that the next segment starts exactly when the previous ends (or with intentional overlap and then crossfade/trim). |

---

## Our Stack (RompMusic) vs Ideal

| Aspect              | Ideal (e.g. Apple)     | Our stack |
|---------------------|------------------------|-----------|
| **Player model**    | Single queue (e.g. AVQueuePlayer) | Two separate expo-audio `AudioPlayer` instances (current + preloaded next). |
| **Web**             | MSE or native HLS      | HTMLMediaElement per track; no MSE. |
| **Format (web)**    | Native or pre-segmented | OGG transcoded on the fly (no range; new stream per track). |
| **Transition**      | Engine-driven          | We swap: promote preloaded → play, then remove old (with overlap to reduce gap). |

So we are **not** in the “single queue / single pipeline” model. We can only **minimize** gaps, not eliminate them at the level Apple does, without a major architecture change (e.g. MSE on web, or native queue API on mobile).

---

## Practical Improvements We Can Make

1. **Overlap transition (already done)**  
   Remove the previous track only **after** the next has started playing (`status.playing`), so there is a short overlap instead of silence.

2. **Trigger transition earlier / prestart at zero volume (implemented)**  
   We prestart the next track at zero volume ~400 ms before end; at ~20 ms before end we promote the preload to current, set volume, and remove the old player (unmute the already-playing next track). This minimizes perceived gap; a small gap may still remain (future work).

3. **Preload readiness**  
   Use `downloadFirst: true` and only promote when the next player is loaded (or play immediately and rely on overlap). Ensure we don’t promote a player that isn’t ready (we already try to play immediately and fallback when loaded).

4. **Faster status updates**  
   Lower `updateInterval` on the preloaded/current player so we get `playing` and position updates sooner and can remove the old track with minimal delay.

5. **Server/encoding (future)**  
   - For OGG transcoding: document or minimize encoder padding; avoid unnecessary silence at start/end.  
   - For native files: gapless metadata (e.g. LAME, AAC) is in the file; we don’t trim it today. MSE or server-side segment concatenation would be needed to use it on web.

6. **Web-only (future)**  
   A proper gapless path on web would mean using **MSE** (or an audio-worklet + buffer scheduling approach): one continuous timeline, append segments, trim padding. That’s a larger client and possibly server change.

---

## References

- Apple: [Transition media gaplessly with HLS](https://developer.apple.com/videos/play/wwdc2021/10142/) (AVQueuePlayer).
- web.dev: [Media Source Extensions for Audio](https://web.dev/articles/mse-seamless-playback) (MSE, append window, gapless metadata).
- Wikipedia / Hydrogenaudio: Gapless playback (codec padding, encoder delay).
- Apple TN2258: AAC encoder delay and synchronization.
