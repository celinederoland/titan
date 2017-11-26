# delphyne
Use docker-compose and scripting to put my projects into production

## Overview

This is a sandbox. Suppose we want to run an identical docker infrastructure locally for development 
and remotely for production.
On this infrastructure, we have :
- 1 redis server
- 1 mysql server, with a database named 'dragoon', which will contain only one table 'Names' with fields id and name.
- 1 project named ladon, it consists on a minimalist python web server (inspired by the example in Docker documentation).
- the project ladon will be deployed on 2 containers, one is named ladon, and the other pyrausta. requests will be load balanced.
- 1 project named cychreides, deployed in a minimalist php7-apache2 web server
- 1 project named demeter, deployed in a minimalist php7-apache2 web server
- 1 project named blog
- 1 haproxy frontend container to dispatch the requests

We want the developer to run the infrastructure locally. 
The admin has ssh access to production server (there is only one machine).


## Installation steps

### Local usage

 - sudo apt-get install docker.io
 - sudo apt-get install docker-compose
 - sudo adduser you docker
 - mkdir /working/path
 - mkdir /working/path/code
 
 
 - add local ssh key into github and bitbucket projects
 
 
 - set your system environment variables
   
   
   DUMPS_PATH="/working/path/databases"
 
 
   DELPH_PATH="/working/path/docker"
   
   
   DEV_PATH="/working/path/code"
 - edit /etc/hosts
   127.0.0.1  blog.localhost blog
   127.0.0.1  ladon.localhost ladon
   127.0.0.1  pyrausta.localhost pyrausta
   127.0.0.1  demeter.localhost demeter
   127.0.0.1  cychreides.localhost cychreides
 - check you have no process listening on port 80
 
 - cd /working/path
 - git clone git@github.com:celinederoland/delphyne.git docker
 - cd docker


 - cp delphyne/docker-compose.override.qexample.yml delphyne/docker-compose.override.yml
 - ... add confidential and custom datas for local development environment in docker-compose.override.yml
 - mkdir config.dev
 - cp -r config.example/* config.dev
 - ... add confidential and custom datas for local development environment in config files ...
 
 - cd scripts
 - sh install-ladon.sh
 - sh install-demeter.sh
 - sh install-cychreides.sh
 - sh install-blog.sh (the repo is private, you need to replace it with your own repo)
 - sh update-delphyne.sh
 - sh install-dragoon.sh (the repo is private, you need to replace it with your own repo)
 

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
