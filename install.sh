sudo docker network create gf-net
sudo docker run -d -v $(pwd)/grapefruit-db:/data/db --restart unless-stopped --network gf-net --name mongodb mongo

git clone https://github.com/bashkirtsevich/grapefruit-web.git
git clone https://github.com/bashkirtsevich/grapefruit-crawler.git

cd grapefruit-web/
sudo docker build -t grapefruit-web .

cd ..
cd grapefruit-crawler/
sudo docker build -t grapefruit-crawler .

sudo docker run -d --restart unless-stopped --network gf-net --name grapefruit-web grapefruit-web
sudo docker run -d -p 6881:6881 --restart unless-stopped --network gf-net --name grapefruit-crawler grapefruit-crawler

cd ..
sudo docker run -d -p 80:80 -v $(pwd)/nginx:/etc/nginx/ -v $(pwd)/nginx-logs:/var/log/nginx --network gf-net --name nginx nginx
