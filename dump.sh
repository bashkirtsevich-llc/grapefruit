docker run --rm --name mongo-dump -v $(pwd)/dumps:/dumps --network gf-net --entrypoint mongodump mongo --host mongodb --db grapefruit --out /dumps
