#!/usr/bin/env bash 

yum install maven

echo "Starting eyulingo-android Unit Tests"

# Put unit test code here
# 

./eyulingo/mvnw clean install

./eyulingo/mvnw test

echo "eyulingo-server Unit Tests complete!"
