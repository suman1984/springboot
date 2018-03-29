FROM java:8
ARG JAR
VOLUME /tmp
ADD ./target/${JAR} app.jar
RUN bash -c 'touch /app.jar'
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-Dspring.profiles.active=container","-jar","/app.jar"]


# FROM openjdk:8-jdk-alpine
# VOLUME /tmp
# ARG JAR
# ADD ./target/${JAR} app.jar
# ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
# #docker run --name springboot -d -p 8080:8080 springboot:latest


# FROM java:openjdk-8-jre-alpine
# VOLUME /tmp
# ARG JAR
# ADD ./target/${JAR} app.jar
# ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]




# FROM openjdk:8-jdk-alpine
# VOLUME /tmp
# ADD ./target/gs-spring-boot-0.1.0.jar app.jar
# ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]
# docker run --name springboot -d -p 8080:8080 springboot:latest

