FROM openjdk:8-jdk-alpine
VOLUME /tmp
ARG JAR_FILE
ADD target/gs-spring-boot-0.1.0.jar gs-spring-boot-0.1.0.jar
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","gs-spring-boot-0.1.0.jar"]