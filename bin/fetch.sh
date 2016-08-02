#!/bin/sh

JSONDIR=`dirname $0`/../json
FILE=`date +%s`.json

cd $JSONDIR
curl --retry 30 http://appservices.citibikenyc.com/v1/station/list > $FILE
ls -r | sed 's/\.json$//' > ../timestamps.txt
cd ../
git add -A .
git commit -m`date +%s`
test -n "$1" && git push
