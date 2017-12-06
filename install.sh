REPO_PATH=$(pwd)

cd $REPO_PATH/grapefruit-web/
docker build -t grapefruit-web .

cd $REPO_PATH/grapefruit-crawler/
docker build -t grapefruit-crawler .

docker network create gf-net

docker run -d --restart unless-stopped --network gf-net -v $REPO_PATH/grapefruit-db:/data/db --name mongodb mongo
docker run -d --restart unless-stopped --network gf-net -p 80:80 -v $REPO_PATH/nginx:/etc/nginx/ -v $REPO_PATH/nginx-logs:/var/log/nginx --name nginx nginx
docker run -d --restart unless-stopped --network gf-net --name grapefruit-web grapefruit-web
docker run -d --restart unless-stopped --network gf-net -p 6881:6881 --name grapefruit-crawler grapefruit-crawler
