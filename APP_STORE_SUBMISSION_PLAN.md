# RompMusic App Store Submission Plan

## Prerequisites

### Apple App Store (iOS)
- **Apple Developer Program** membership ($99/year): https://developer.apple.com/programs/
- **Apple ID** with 2FA enabled
- **App Store Connect** app record created

### Google Play Store (Android)
- **Google Play Developer** account ($25 one-time): https://play.google.com/console/
- **Google account** for Play Console

## Step 1: Configure app.json

Update `rompmusic-client/app.json` with:
- `expo.ios.bundleIdentifier`: e.g. `com.rompmusic.app`
- `expo.android.package`: e.g. `com.rompmusic.app`
- Version/build numbers for each store

## Step 2: Install EAS CLI and Login

```bash
npm install -g eas-cli
eas login
```

Note: EAS requires an Expo account. Create one at https://expo.dev/signup if needed.

## Step 3: Configure EAS Build

An `eas.json` is already configured in `rompmusic-client/`. Run:

```bash
cd rompmusic-client
eas build:configure
```

This will prompt for Expo login and optionally link the project to EAS.

## Step 4: Build for Production

```bash
cd rompmusic-client

# Build Android APK/AAB
eas build --platform android --profile production

# Build iOS (requires Apple Developer account)
eas build --platform ios --profile production

# Or build both
eas build --platform all --profile production
```

## Step 5: Submit to Stores

### Android
```bash
eas submit --platform android --latest
```
- Default: internal testing track
- Use `--track production` for production release

### iOS
```bash
eas submit --platform ios --latest
```
- Submits to TestFlight
- From TestFlight, promote to App Store via App Store Connect

## Step 6: Store Listings

### App Store (iOS)
- Screenshots (6.5", 5.5" required)
- App description, keywords
- Privacy policy URL
- Support URL
- Age rating
- Copyright

### Play Store (Android)
- Screenshots (phone, 7" tablet, 10" tablet)
- Feature graphic (1024x500)
- Short/long description
- Privacy policy URL
- Content rating questionnaire

## Environment-Specific API URL

For production builds, ensure `EXPO_PUBLIC_API_URL` is set to your server (e.g. `https://rompmusic.com/api/v1`) in the build environment or app.json extra config.

## Checklist Before Submission

- [ ] Bundle ID / package name finalized
- [ ] App icons and splash screen verified
- [ ] Privacy policy URL live
- [ ] Support/contact URL ready
- [ ] API server production-ready
- [ ] Test on physical devices
