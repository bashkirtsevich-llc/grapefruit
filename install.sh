docker network create gf-net
docker run -d -v $(pwd)/grapefruit-db:/data/db --restart unless-stopped --network gf-net --name mongodb mongo

git clone https://github.com/bashkirtsevich/grapefruit-web.git
git clone https://github.com/bashkirtsevich/grapefruit-crawler.git

cd grapefruit-web/
docker build -t grapefruit-web .

cd ..
cd grapefruit-crawler/
docker build -t grapefruit-crawler .

docker run -d --restart unless-stopped --network gf-net --name grapefruit-web grapefruit-web
docker run -d -p 6881:6881 --restart unless-stopped --network gf-net --name grapefruit-crawler grapefruit-crawler

cd ..
docker run -d -p 80:80 -v $(pwd)/nginx:/etc/nginx/ -v $(pwd)/nginx-logs:/var/log/nginx --network gf-net --name nginx nginx
