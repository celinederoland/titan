#!/usr/bin/env bash

cd $DELPH_PATH/titan
git pull
docker-compose down
docker-compose up --build -d --remove-orphan