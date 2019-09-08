#!/usr/bin/env bash 

cp ../eyulingo/src/main/properties_release/application.properties ../eyulingo/src/main/resources/application.properties
cp ../eyulingo-admin/src/main/properties_release/application.properties ../eyulingo-admin/src/main/resources/application.properties
cp ../eyulingo-store/src/main/properties_release/application.properties ../eyulingo-store/src/main/resources/application.properties

cd sql-docker
./build_docker.sh
cd ../

cd springboot-docker
./build_docker.sh
cd ../

cd admin-docker
./build_docker.sh
cd ../

cd dist-docker
./build_docker.sh
cd ../

docker push yuxiqian/eyulingo-mysql
docker push yuxiqian/eyulingo-server
docker push yuxiqian/eyulingo-admin
docker push yuxiqian/eyulingo-dist

docker-compose up

cp ../eyulingo-store/src/main/properties_debug/application.properties ../eyulingo-store/src/main/resources/application.properties
cp ../eyulingo-admin/src/main/properties_debug/application.properties ../eyulingo-admin/src/main/resources/application.properties
cp ../eyulingo/src/main/properties_debug/application.properties ../eyulingo/src/main/resources/application.properties
