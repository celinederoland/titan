#!/usr/bin/env bash
# usage : sh update-remote.sh user@remote-server path/to/delphyne/project/on/remote

echo "copy ../delphyne/docker-compose.override.prod.yml to $1:$2/delphyne/docker-compose.override.yml"
scp ../delphyne/docker-compose.override.prod.yml \
$1:$2/delphyne/docker-compose.override.yml

echo "copy ../config.prod to $1:$2/config"
scp -r ../config.prod/* \
$1:$2/config

ssh $1 "tree $2/config.prod"