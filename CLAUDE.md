# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

SmokePing network latency monitoring deployment using Docker Compose. Runs the `linuxserver/smokeping` image with pre-configured targets for major cloud providers (GCE, AWS EC2, Azure, Rackspace, Vultr, Linode, DigitalOcean), internet sites, DNS servers, and regional endpoints.

## Running

```bash
touch smokeping/config/Private   # required file, gitignored - for custom private targets
docker compose up -d             # starts SmokePing on port 8099
docker compose down              # stops SmokePing
docker compose logs smokeping    # view logs
```

The web UI is available at `http://<host>:8099`.

## Architecture

- **`docker-compose.yml`** — Single service (`linuxserver/smokeping`), maps port 8099→80, mounts config/data volumes
- **`smokeping/etc/config`** — Master config that `@include`s all files from `smokeping/config/`
- **`smokeping/config/`** — Modular SmokePing configuration:
  - `General` — Owner, contact, CGI URL settings
  - `Targets` — All ping targets organized by provider/category (the main file to edit for adding/removing hosts)
  - `Probes` — Probe definitions (FPing, SSH)
  - `Alerts` — Alert thresholds for RTT and packet loss
  - `Database` — RRD step interval (300s) and retention policy
  - `Presentation` — Web UI chart and detail view settings
  - `Slaves` — Distributed monitoring config (currently commented out)
  - `pathnames` — Internal paths for data/cache/pid directories
  - `Private` — Gitignored file for custom/private targets
- **`smokeping/data/`** — RRD data files (gitignored, created at runtime)

## SmokePing Config Syntax

Targets use a hierarchy: `+` = top-level group, `++` = subgroup, `+++` = individual host. Each host entry needs `menu`, `title`, and `host` fields. The default probe is FPing.

## Key Details

- Container runs as UID/GID 1001, timezone UTC
- Memory limit: 4096MB
- Database polls every 300 seconds (5 min) with 20 pings per cycle
- Private targets go in `smokeping/config/Private` (not committed to git)