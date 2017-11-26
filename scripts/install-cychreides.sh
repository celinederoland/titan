#!/usr/bin/env bash

if [ ! -d "$DEV_PATH/sandbox" ]; then
  echo "clone distant repository to $DEV_PATH/sandbox"
  git clone git@github.com:celinederoland/sandbox.git $DEV_PATH/sandbox
fi
echo "linking $DEV_PATH/sandbox/cychreides project to $DEV_PATH/cychreides"
cd $DEV_PATH
ln -s sandbox/cychreides cychreides
