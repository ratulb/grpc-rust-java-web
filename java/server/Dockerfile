#FROM maven:3.5.4-jdk-8-alpine as maven
FROM maven:3.8.1-jdk-11 as maven
COPY ./pom.xml ./pom.xml
COPY ./src ./src
RUN mvn dependency:go-offline -B
RUN mvn package
FROM openjdk:11.0.4-jre-slim-buster
EXPOSE 31031
WORKDIR /home
COPY --from=maven target/server-1.0-SNAPSHOT.jar ./server-1.0-SNAPSHOT.jar
CMD ["java", "-jar", "./server-1.0-SNAPSHOT.jar"]
