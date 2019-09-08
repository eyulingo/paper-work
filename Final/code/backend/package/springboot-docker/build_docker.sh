#!/usr/bin/env bash 

cd ../../eyulingo

./mvnw clean package -DskipTests

mv target/eyulingo-0.0.1-SNAPSHOT.jar ../package/springboot-docker/app.jar

cd ../package/springboot-docker

docker build -t yuxiqian/eyulingo-server .