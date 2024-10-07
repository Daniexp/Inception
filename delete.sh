#!/bin/bash

docker stop $(docker ps -aq)
docker rm $(docker ps -aq)
docker volume rm $(docker volume ls -q)
rm -rf /home/dexposit/data/mariadb/*
rm -rf /home/dexposit/data/wordpress/*
clear
