# systemd: RompMusic stack on boot

After a host reboot, Docker starts `rompmusic-db`, `rompmusic-redis`, and `rompmusic-server` only if they use a **restart policy** and/or something runs `docker compose up -d`.

This repo’s `docker-compose.yml` sets `restart: unless-stopped` on **db**, **redis**, and **server** (matching **website** and **client**).

Optional **belt-and-suspenders**: install `rompmusic-stack.service` so systemd runs compose once Docker is up:

```bash
sudo install -m 644 deploy/systemd/rompmusic-stack.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable --now rompmusic-stack.service
```

Check status: `systemctl status rompmusic-stack.service`

Reload stack after editing compose: `sudo systemctl reload rompmusic-stack.service` (runs `docker compose up -d` again).
