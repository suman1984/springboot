FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAR
ADD ./target/${JAR} app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
#docker run --name springboot -d -p 8080:8080 springboot:latest




FROM openjdk:8-jdk-alpine
VOLUME /tmp
ADD ./target/gs-spring-boot-0.1.0.jar app.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
#docker run --name springboot -d -p 8080:8080 springboot:latest
