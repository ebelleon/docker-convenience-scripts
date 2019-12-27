#!/bin/sh

echo "Stoping Docker Container and removing Volumes:"
echo
docker stop $(docker container ls -a -q)

echo "Removing all Containers"
echo
docker rm $(docker container ls -a -q)

echo "Force remove all volumes"
echo
docker volume prune -f

echo "Force remove all networks"
echo
docker network prune -f

echo "Removing all Images:"
echo
docker rmi $(docker images -a -q)
