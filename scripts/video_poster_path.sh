#!/bin/bash

DBNAME=dbname
USER=username
PASS=password
HOST=localhost
FOLDER=/example/folder #Needs to be absolute path
STATEMENT="select poster_path from video;"

COUNTER=$(mysql $DBNAME -h $HOST -u$USER -p$PASS  -e "$STATEMENT")

for entry in $COUNTER; do
if [ ! -f $FOLDER/images/t/p/w300$entry ]; then
wget 'https://image.tmdb.org/t/p/w300'$entry -O $FOLDER/images/t/p/w300$entry
fi

if [ ! -f $FOLDER/images/t/p/w500$entry ]; then
wget 'https://image.tmdb.org/t/p/w500'$entry -O $FOLDER/images/t/p/w500$entry
fi
done