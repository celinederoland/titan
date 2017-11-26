# titan
Use docker-compose and scripting to put my projects into production

## Overview

This is not a sandbox. 
On this infrastructure, we have :
- 1 project named blog
- 1 haproxy frontend container to dispatch the requests

We want the developer to run the infrastructure locally. 
The admin has ssh access to production server (there is only one machine).


## Installation steps

### Local usage
 
 - mkdir /working/path
 - cd /working/path  
 - mkdir /working/path/code
 
 
 - git clone git@github.com:celinederoland/titan.git docker
 - cd docker


 - sudo apt-get install docker.io
 - sudo apt-get install docker-compose
 - sudo adduser you docker
 - (or sh /working/path/docker/clean-docker.sh)
 
 - add local ssh key into github and bitbucket projects
 
 
 - set your system environment variables
   
   
   DUMPS_PATH="/working/path/databases"
 
 
   DELPH_PATH="/working/path/docker"
   
   
   DEV_PATH="/working/path/code"
 - edit /etc/hosts
   127.0.0.1  <projects>.localhost <projects>
 - check you have no process listening on port 80


 - cp titan/docker-compose.override.example.yml titan/docker-compose.override.yml
 - ... add confidential and custom datas for local development environment in docker-compose.override.yml
 - mkdir config.dev
 - cp -r config.example/* config.dev
 - ... add confidential and custom datas for local development environment in config files ...
 
 - cd scripts
 - sh install-`projects`.sh
 - sh update-titan.sh
 - sh install-`databases`.sh (the repo is private, you need to replace it with your own repo)
 

### Remote usage

 - do the same. 
 The configuration files can be edited locally and then pushed on remote 
 following the steps below on local environment

 - mkdir config.prod
 - cp -r config.example/* config.prod
 - ... add confidential and custom datas for remote production environment in config files ...
 - cp docker-compose.override.example.yml docker-compose.override.prod.yml
 - ... add confidential and custom datas for remote production environment in docker-compose.override.prod.yml
 - sh update-remote.sh user@remote-server /server/working/path/docker
