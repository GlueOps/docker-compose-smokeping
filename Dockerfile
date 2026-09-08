FROM linuxserver/smokeping@sha256:621c60142255ebfdb97ace2aa0cf0bfd8058ec430813dc66e2168f9d024f7043

# Embed SmokePing configuration
COPY smokeping/config/ /config/
COPY smokeping/etc/config /etc/smokeping/config
COPY smokeping/etc/ssmtp.conf /etc/ssmtp/ssmtp.conf

# Create empty Private file if not present (gitignored, may not exist in build context)
RUN touch /config/Private

# Data directory for RRD files
VOLUME /data