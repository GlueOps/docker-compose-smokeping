FROM linuxserver/smokeping@sha256:6861c15df8151c454ed09da610b64c86bc274748e664f53f3e15ec1a3cd45431

# Embed SmokePing configuration
COPY smokeping/config/ /config/
COPY smokeping/etc/config /etc/smokeping/config
COPY smokeping/etc/ssmtp.conf /etc/ssmtp/ssmtp.conf

# Create empty Private file if not present (gitignored, may not exist in build context)
RUN touch /config/Private

# Data directory for RRD files
VOLUME /data