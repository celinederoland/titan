#!/usr/bin/env bash

if [ ! -d "$DEV_PATH/sandbox" ]; then
  echo "clone distant repository to $DEV_PATH/sandbox"
  git clone git@github.com:celinederoland/sandbox.git $DEV_PATH/sandbox
fi
cd $DEV_PATH
echo "linking $DEV_PATH/sandbox/demeter project to $DEV_PATH/demeter"
ln -s sandbox/demeter demeter