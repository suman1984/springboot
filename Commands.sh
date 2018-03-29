sudo docker run --name springboot -d -p 8080:8080 springboot:latest



sudo docker build --build-arg JAR=gs-spring-boot-0.1.0.jar  -t springboot-dev:latest .
sudo docker build --build-arg JAR=gs-spring-boot-0.1.0.jar  -t springboot-stage:latest .
sudo docker build --build-arg JAR=gs-spring-boot-0.1.0.jar  -t springboot-prod:latest .

sudo docker build --build-arg JAR=otcr-user-service-0.0.1-SNAPSHOT.jar  -t otcr-user-service-dev:latest .






sudo docker run --name springboot-dev -d -p 8090:8080 springboot-dev:latest
sudo docker run --name springboot-stage -d -p 8091:8080 springboot-stage:latest
sudo docker run --name springboot-prod -d -p 8092:8080 springboot-prod:latest


sudo docker run --name otcr-user-service-dev -d -p 8095:8080 otcr-user-service-dev:latest





DEV	:	http://35.172.135.138:8090/

STAGE:	http://35.172.135.138:8091/
PROD:	http://35.172.135.138:8092/

otcr-user-service

DEV:	http://35.172.135.138:8095/


sudo docker run --name springboot-dev -d -p 8080:8080 springboot:dev




#!/bin/bash
CONTAINERNAME=springboot-dev
PORTMAPPING=8090
cd ~
if [ $(sudo docker ps -a | grep $CONTAINERNAME | wc -l) -gt 1 ];then
	CONTAINERID=$(sudo docker ps -a | grep $CONTAINERNAME | cut -f 1 -d " ")
	sudo docker stop $CONTAINERID
	sudo docker rm $CONTAINERID
fi
sudo docker build -t CONTAINERNAME:latest .
sudo docker run --name $CONTAINERNAME -d -p $PORTMAPPING:8080 $CONTAINERNAME:latest


1. Commit Code in GIT
2. Code Pull
3. Code Build
4. Run TestCases
5. Generate Jar file
6. Upload to Artifactory
7. Publish Artifacts to Instace
8. DEV AutoDeploy: Build Docker IMAGE for DEV and DEPLOY Container
8. STAGE ManualApproval: Build Docker IMAGE for STAGE and DEPLOY Container
9. PROD ManualApproval: Build Docker IMAGE for PROD and DEPLOY Container
