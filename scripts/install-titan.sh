#!/usr/bin/env bash

ln -s $DELPH_PATH/scripts/clean-docker.sh /usr/local/bin/titan-clean-docker
ln -s $DELPH_PATH/scripts/update-titan.sh /usr/local/bin/titan-update-titan
ln -s $DELPH_PATH/scripts/stop-titan.sh /usr/local/bin/titan-stop-titan

ln -s $DELPH_PATH/scripts/update-remote.sh /usr/local/bin/titan-update-remote

ln -s $DELPH_PATH/scripts/install-blog.sh /usr/local/bin/titan-install-blog

ln -s $DELPH_PATH/scripts/install-dragoon.sh /usr/local/bin/titan-install-aella

ln -s $DELPH_PATH/scripts/install-aella.sh /usr/local/bin/titan-install-aella
ln -s $DELPH_PATH/scripts/compile-aella.sh /usr/local/bin/titan-compile-aella
ln -s $DELPH_PATH/scripts/update-blog.sh /usr/local/bin/titan-update-blog
