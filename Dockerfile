FROM linuxserver/smokeping@sha256:0c8b547eda8812e16f9888eccd0e08af211431f16e7e0d4d233cb699e8883394

# Embed SmokePing configuration
COPY smokeping/config/ /config/
COPY smokeping/etc/config /etc/smokeping/config
COPY smokeping/etc/ssmtp.conf /etc/ssmtp/ssmtp.conf

# Create empty Private file if not present (gitignored, may not exist in build context)
RUN touch /config/Private

# Data directory for RRD files
VOLUME /data