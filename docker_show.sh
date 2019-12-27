#!/bin/sh

docker images
echo
docker container ls -a
echo
docker network ls
echo
docker volume ls