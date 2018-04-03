sudo docker run --name springboot -d -p 8080:8080 springboot:latest



sudo docker build --build-arg JAR=gs-spring-boot-0.1.0.jar  -t springboot-dev:latest .
sudo docker build --build-arg JAR=gs-spring-boot-0.1.0.jar  -t springboot-stage:latest .
sudo docker build --build-arg JAR=gs-spring-boot-0.1.0.jar  -t springboot-prod:latest .

sudo docker build --build-arg JAR=otcr-user-service-0.0.1-SNAPSHOT.jar  -t otcr-user-service-dev:latest .


sudo docker build --build-arg JAR=otcr-user-service-0.0.1-SNAPSHOT.jar  -t otcr-user-service-dev:latest .






sudo docker run --name springboot-dev -d -p 8090:8080 springboot-dev:latest
sudo docker run --name springboot-stage -d -p 8091:8080 springboot-stage:latest
sudo docker run --name springboot-prod -d -p 8092:8080 springboot-prod:latest


sudo docker run --name otcr-user-service-dev -d -p 8095:9090 otcr-user-service-dev:latest
sudo docker run --name otcr-user-service-stage -d -p 8096:9090 otcr-user-service-stage:latest
sudo docker run --name otcr-user-service-prod -d -p 8097:9090 otcr-user-service-prod:latest


sudo docker run --name otcr-definition-service-dev -d -p 8098:8085 otcr-definition-service-dev:latest
sudo docker run --name otcr-definition-service-stage -d -p 8099:8085 otcr-definition-service-stage:latest
sudo docker run --name otcr-definition-service-prod -d -p 8100:8085 otcr-definition-service-prod:latest





Spring boot demo
DEV	:	http://52.90.137.48:8090/
STAGE:	http://52.90.137.48:8091/
PROD:	http://52.90.137.48:8092/

otcr-user-service

DEV:	http://52.90.137.48:8095/
STAGE:	http://52.90.137.48:8096/
PROD:	http://52.90.137.48:8097/

otcr-user-service

DEV:	http://52.90.137.48:8098/
STAGE:	http://52.90.137.48:8099/
PROD:	http://52.90.137.48:8100/

PROD:	http://52.90.137.48:8085/


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
