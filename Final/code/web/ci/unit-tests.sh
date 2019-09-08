#!/usr/bin/env bash 

echo " - [ ] Starting eyulingo-admin Build Tests"

cd eyulingo-admin

npm install

npm run Build

cd ../

echo " - [x] eyulingo-admin Build Tests complete!"

echo " - [ ] Starting eyulingo-dist Build Tests"

cd eyulingo-dist

npm install

npm run Build

cd ../

echo " - [x] eyulingo-dist Build Tests complete!"