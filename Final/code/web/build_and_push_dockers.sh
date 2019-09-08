#!/usr/bin/env bash 

cd eyulingo-admin
./build_docker.sh
cd ../

cd eyulingo-dist
./build_docker.sh
cd ../

docker push yuxiqian/eyulingo-admin
docker push yuxiqian/eyulingo-dist
