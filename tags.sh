#!/bin/bash


export LATEST_TAG_BACK=$(curl -s "https://hub.docker.com/v2/repositories/jpcc141999/back_jenkis/tags/?page_size=1" | jq -r '.results[0].name')
export LATEST_TAG_FRONT=$(curl -s "https://hub.docker.com/v2/repositories/jpcc141999/front_jenkis/tags/?page_size=1" | jq -r '.results[0].name')
export LATEST_TAG_DB=$(curl -s "https://hub.docker.com/v2/repositories/jpcc141999/db_jenkis/tags/?page_size=1" | jq -r '.results[0].name')



echo "Último tag encontrado del back: $LATEST_TAG_BACK"
echo "Último tag encontrado del front: $LATEST_TAG_FRONT"
echo "Último tag encontrado del db: $LATEST_TAG_DB"

docker pull jpcc141999/back_jenkis:$LATEST_TAG_BACK
docker pull jpcc141999/front_jenkis:$LATEST_TAG_FRONT
docker pull jpcc141999/db_jenkis:$LATEST_TAG_DB

bash