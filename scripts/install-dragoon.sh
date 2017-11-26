#!/usr/bin/env bash

echo -n "Password?\n"
stty_orig=`stty -g`
stty -echo
read pwd
stty $stty_orig

if [ ! -d "$DUMPS_PATH" ]; then
  echo "clone distant repository to $DUMPS_PATH"
  git clone git@bitbucket.org:celinederoland/databases.git $DUMPS_PATH
fi

echo "update databases repository"
cd $DUMPS_PATH
git pull

echo "execute sql dump into docker container"
cat $DUMPS_PATH/dragoon.sql | \
sudo docker exec -i delphyne_sql_dragoon_1 \
/usr/bin/mysql -u root --password=$pwd dragoon