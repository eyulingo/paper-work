#!/usr/bin/env bash

# echo "[ ] removing web repo ... "
# rm -rf eyulingo-web
# echo "[x] removed. "

echo "[ ] stopping docker-compose images ... "
docker-compose stop
echo "[*] stopped docker-compose images"

echo "[ ] removing docker-compose images ... "
echo y | docker-compose rm
echo "[*] removed docker-compose images"

echo "[ ] removing obsolete images ... "
docker images | grep -E "(eyulingo-server|eyulingo-mysql|eyulingo-admin|eyulingo-dist)" | awk '{print $3}' | uniq | xargs -I {} docker rmi --force {}
echo "[*] removed obsolete images"

# echo "[ ] cloning front-end repo ... "
# git clone https://github.com/eyulingo/eyulingo-web
# echo "[x] cloned front-end repo"

# echo "[ ] building admin page ... "

# cd ./eyulingo-web/eyulingo-admin/
# ./build_docker.sh

# cd ../../
# echo "[x] successfully built admin page "

# echo "[ ] building distributor page ... "

# cd ./eyulingo-web/eyulingo-dist/
# ./build_docker.sh

# cd ../../
# echo "[x] successfully built distributor page "

echo "[ ] starting docker-compose images ... "
docker-compose up
echo "[x] stopped docker-compose images "

# echo "[ ] removing web repo ... "
# rm -rf eyulingo-web
# echo "[x] removed. "