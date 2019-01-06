#!/bin/bash

DBNAME=dbname
USER=username
PASS=password
HOST=localhost
FOLDER=/example/folder #Needs to be absolute path
STATEMENT="select backdrop_path from tv_show;"

COUNTER=$(mysql $DBNAME -h $HOST -u$USER -p$PASS  -e "$STATEMENT")

for entry in $COUNTER; do
if [ ! -f $FOLDER/images/t/p/w1280$entry ]; then
wget 'https://image.tmdb.org/t/p/w1280'$entry -O $FOLDER/images/t/p/w1280$entry
fi
done
