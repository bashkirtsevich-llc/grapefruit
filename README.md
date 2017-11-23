## Description
Grapefruit — is a bittorrent dht crawler & search engine

## Installation

### Install Docker
```bash
# exec with superuser permissions
yum install -y yum-utils device-mapper-persistent-data lvm2 git
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install docker-ce
systemctl start docker
systemctl enable docker
```

### Start containers
```basah
sudo docker network create gf-net
mkdir grapefruit-db
sudo docker run -d -v ~/grapefruit-db:/data/db --restart unless-stopped --network gf-net --name mongodb mongo
git clone https://github.com/bashkirtsevich/grapefruit-web.git
cd grapefruit-web/
sudo docker build -t grapefruit-web .
sudo docker run -d --restart unless-stopped --network gf-net --name grapefruit-web grapefruit-web
cd -
git clone https://github.com/bashkirtsevich/grapefruit-crawler.git
cd grapefruit-crawler/
sudo docker build -t grapefruit-crawler .
sudo docker run -d -p 6881:6881 --restart unless-stopped --network gf-net --name grapefruit-crawler grapefruit-crawler
cd -
mkdir nginx
mkdir nginx-logs
sudo docker run -d -p 80:80 -v ~/nginx:/etc/nginx/ -v ~/nginx-logs:/var/log/nginx --network gf-net --name nginx nginx
```

## Tools

### Dump database
```bash
mkdir dumps
sudo docker run --rm --name mongo-dump -v ~/dumps:/dumps --network gf-net --entrypoint mongodump mongo --host mongodb --db grapefruit --out /dumps
```
