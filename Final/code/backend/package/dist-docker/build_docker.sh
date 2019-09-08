#!/usr/bin/env bash 

cd ../../eyulingo-store

./mvnw clean package -DskipTests

mv target/eyulingo-0.0.1-SNAPSHOT.jar ../package/dist-docker/app.jar

cd ../package/dist-docker

docker build -t yuxiqian/eyulingo-dist .