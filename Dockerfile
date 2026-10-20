FROM linuxserver/smokeping@sha256:41ad1006ee392f6045ec24a0a8127a880bb95dc7bde1a5b3a381c16c0b41a9d9

# Embed SmokePing configuration
COPY smokeping/config/ /config/
COPY smokeping/etc/config /etc/smokeping/config
COPY smokeping/etc/ssmtp.conf /etc/ssmtp/ssmtp.conf

# Create empty Private file if not present (gitignored, may not exist in build context)
RUN touch /config/Private

# Data directory for RRD files
VOLUME /data