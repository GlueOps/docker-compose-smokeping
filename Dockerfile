FROM linuxserver/smokeping@sha256:b38cae89eb9d2ac49858533b723ea514eb0501f50d179c715d89e5e7214950da

# Embed SmokePing configuration
COPY smokeping/config/ /config/
COPY smokeping/etc/config /etc/smokeping/config
COPY smokeping/etc/ssmtp.conf /etc/ssmtp/ssmtp.conf

# Create empty Private file if not present (gitignored, may not exist in build context)
RUN touch /config/Private

# Data directory for RRD files
VOLUME /data