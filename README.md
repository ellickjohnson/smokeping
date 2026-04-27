# SmokePing Docker (with msmtp)

Custom SmokePing Docker image based on [linuxserver/smokeping](https://hub.docker.com/r/linuxserver/smokeping) with **msmtp** added for email alerting.

## What's Added

- `msmtp` + `msmtp-mta` for sending email alerts
- Custom init script that templates `/etc/msmtprc` from environment variables
- Symlinks `sendmail` → `msmtp` so SmokePing alerts work out of the box

## Environment Variables

| Variable | Required | Default | Description |
|----------|----------|---------|-------------|
| `SMTP_HOST` | Yes | - | SMTP server hostname |
| `SMTP_PORT` | No | `587` | SMTP port |
| `SMTP_USER` | Yes | - | SMTP username |
| `SMTP_PASS` | Yes | - | SMTP password |
| `SMTP_FROM` | No | `$SMTP_USER` | From address |
| `SMTP_TLS` | No | `on` | Enable TLS |

## Usage

```yaml
services:
  smokeping:
    image: ghcr.io/ellickjohnson/smokeping:latest
    environment:
      - SMTP_HOST=smtp.gmail.com
      - SMTP_PORT=587
      - SMTP_USER=you@gmail.com
      - SMTP_PASS=app-password
      - SMTP_FROM=you@gmail.com
      - PUID=1000
      - PGID=1000
      - TZ=America/Denver
    volumes:
      - ./config:/config
      - ./data:/data
    ports:
      - 9080:80
```

## Building

Automated builds via GitHub Actions on push to `main`.
