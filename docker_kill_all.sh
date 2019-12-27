#!/bin/sh

while true; do
    read -r -p "Are you sure you want to delete ALL Docker data? You will not be able to recover any data! [y/N]" input
    case $input in 
        [yY][eE][sS]|[yY]*)
            echo "Stoping Docker Container and removing Volumes:"
            docker stop $(docker container ls -a -q)
            echo

            echo "Removing all Containers"
            docker rm $(docker container ls -a -q)
            echo

            echo "Force remove all volumes"
            docker volume prune -f
            echo

            echo "Force remove all networks"
            docker network prune -f
            echo

            echo "Removing all Images:"
            docker rmi $(docker images -a -q)
            echo
            break;;
        [nN][oO]|[nN]*)
            echo "Exiting Script"
            exit;;
        *)
            echo "Exiting Script"
            exit;;
    esac
done
