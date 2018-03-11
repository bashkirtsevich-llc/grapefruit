<p align="center">
  <img src="https://raw.githubusercontent.com/bashkirtsevich-llc/grapefruit-web/master/static/logo.png">
</p>

# Grapefruit
Grapefruit — is a bittorrent search spyder crawler search engine, based on dht-bittorrent network.

## Installation
1. Install Docker (optional)
```bash
# For Centos-7 (as root user)
curl https://raw.githubusercontent.com/bashkirtsevich-llc/grapefruit/master/tools/docker-install.sh | /bin/bash
usermod -aG docker $USER
reboot
```
2. Download grapefruit docker compose file
```bash
wget https://raw.githubusercontent.com/bashkirtsevich-llc/grapefruit/master/docker-compose.yml
```
3. Add SSL certs in `nginx-proxy` in `docker-compose.yml` (optional)
```yaml
...
    volumes:
      - "/path/to/htpasswd:/etc/nginx/htpasswd"
      - "path/to/certs:/etc/nginx/certs"
```
4. Set virtual host name in `docker-compose.yml`
```yaml
...
    environment:
      - "VIRTUAL_HOST=grapefruit.your.domain"
```
5. Start application
```bash
docker-compose up -d
```

## Components
* mongodb
* nginx-proxy
* [grapefruit-crawler](https://hub.docker.com/r/bashkirtsevich/grapefruit-crawler/)
* [grapefruit-web](https://hub.docker.com/r/bashkirtsevich/grapefruit-web/)
