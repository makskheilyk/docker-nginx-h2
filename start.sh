#!/bin/bash

cd conf/openssl/

bash create-cert.sh

cd ../../

docker-compose build

docker-compose up -d


rm -r  conf/openssl/private
rm -r  conf/openssl/certs