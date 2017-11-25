# Grapefruit
Grapefruit — as a bittorrent search spyder crawler search engine, based on dht-bittorrent network.

## Installation
1. Download grapefruit installer repository
```bash
git clone https://github.com/bashkirtsevich/grapefruit.git
cd grapefruit
```
2. Install Docker (optional)
```bash
# For Centos-7
sudo ./docker-install.sh
sudo usermod -aG docker $USER
sudo reboot
```
3. Build & run all
```bash
./install.sh
```

## Dump database
```bash
./dump.sh
```

## Components
* mongodb
* nginx
* grapefruit-crawler
* grapefruit-web
