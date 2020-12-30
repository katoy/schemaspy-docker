#!/bin/bash

rm -fr download
mkdir download
cd download
wget https://sp.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip
unzip dvdrental.zip

dropdb dvdrental
createdb --owner admin dvdrental
pg_restore -U admin --no-owner --role=admin -d dvdrental ./dvdrental.tar

echo "ALTER TABLE store ADD 店名 varchar;" | psql -U admin dvdrental
cd ..
rm -fr download
rm -fr output
mkdir output

docker build -t schemaspy/japanese:ipaexg00401 .
./run.sh
open output/index.html
