#!/usr/bin/env bash
# usage : sh update-remote.sh user@remote-server path/to/titan/project/on/remote

echo "copy ../titan/docker-compose.override.prod.yml to $1:$2/titan/docker-compose.override.yml"
scp ../titan/docker-compose.override.prod.yml \
$1:$2/titan/docker-compose.override.yml

echo "copy ../config.prod to $1:$2/config"
scp -r ../config.prod/* \
$1:$2/config

ssh $1 "tree $2/config"