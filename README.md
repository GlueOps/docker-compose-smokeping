# SmokePing Docker Compose
SmokePing Docker Compose with Common Cloud Server Providers

## Built-in Providers

- Google Compute Engine (GCE)
- Amazon Elastic Compute Cloud (EC2)
- Azure Virtual Machines (Azure VM)
- Rackspace Virtual Cloud Servers (VCS)
- Vultr
- Linode
- DigitalOcean

## Setup & Usage

```bash
curl -fsSL https://get.docker.com | sh
sudo usermod -aG docker $USER
newgrp docker

git clone https://github.com/GlueOps/docker-compose-smokeping.git
cd docker-compose-smokeping
touch smokeping/config/Private
docker compose up -d
```

## Access Smokeping

Capture the output of
```bash
curl icanhazip.com
```

goto http://ip.address.from.above:8099
