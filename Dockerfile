FROM lscr.io/linuxserver/smokeping:latest

# Install msmtp for email alerting
RUN apk add --no-cache msmtp msmtp-mta

# Copy custom init scripts
COPY root/ /
