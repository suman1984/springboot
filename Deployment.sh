#!/bin/bash

#CONTAINERNAME=springboot-dev
#PORTMAPPING=8090

CONTAINERNAME=$1
PORTMAPPING=$2
TAG=$3
JARFILE=$4
echo "CONTAINERNAME = $CONTAINERNAME"
echo "PORTMAPPING = $PORTMAPPING"
echo "JARFILE = $JARFILE"
echo "TAG = $TAG"
cd ~
echo " -------------------------- LISTING DOCKER IMAGES BEFORE BUILD --------------------------"
echo "$(sudo docker images)"
sudo docker build --build-arg  JAR=$JARFILE -t $CONTAINERNAME:$TAG .
echo " -------------------------- LISTING DOCKER IMAGES AFTER BUILD --------------------------"
echo "$(sudo docker  images)"
if [ $(sudo docker ps -a | grep $CONTAINERNAME | wc -l) -gt 0 ];then
	echo " -------------------------- LISTING DOCKER CONTAINES $CONTAINERNAME --------------------------"
	echo "$(sudo docker ps -a | grep $CONTAINERNAME)"
	CONTAINERID=$(sudo docker ps -a | grep $CONTAINERNAME | cut -f 1 -d " ")
	sudo docker stop $CONTAINERID
	sudo docker rm $CONTAINERID
fi
echo " -------------------------- LISTING DOCKER ALL CONTAINERS BEFORE START --------------------------"
echo "$(sudo docker ps -a)"
sudo docker run --name $CONTAINERNAME -d -p $PORTMAPPING:8080 $CONTAINERNAME:$TAG
echo " -------------------------- LISTING RUNNING DOCKER CONTAINER $CONTAINERNAME AFTER START --------------------------"
echo "$(sudo docker ps | grep $CONTAINERNAME)"

# Deployment.sh springboot-dev 8090 gs-spring-boot-0.1.0.jar
# Deployment.sh springboot-stage 8091 gs-spring-boot-0.1.0.jar
# Deployment.sh springboot-prod 8092 gs-spring-boot-0.1.0.jar



