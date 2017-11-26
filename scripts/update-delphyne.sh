#!/usr/bin/env bash

cd $DELPH_PATH/delphyne
git pull
docker-compose down
docker-compose up --build -d