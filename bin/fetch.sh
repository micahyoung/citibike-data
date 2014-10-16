#!/bin/sh

JSONDIR=`dirname $0`/../json
FILE=`date +%s`.json

cd $JSONDIR
curl --retry 30 http://appservices.citibikenyc.com/data2/stations.php > $FILE
git add -A .
git commit -m`date +%s`
test -n "$1" && git push
