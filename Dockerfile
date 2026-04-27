FROM lscr.io/linuxserver/smokeping:latest

# Install msmtp for email alerting (includes sendmail symlink in Alpine 3.22+)
RUN apk add --no-cache msmtp

# Copy custom init scripts
COPY root/ /
