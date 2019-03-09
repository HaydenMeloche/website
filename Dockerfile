FROM adoptopenjdk/openjdk11:latest
RUN mkdir /opt/app
COPY target/HaydensPortfolioAPI-0.0.1-SNAPSHOT.jar /opt/app
CMD ["java", "-jar", "/opt/app/HaydensPortfolioAPI-0.0.1-SNAPSHOT.jar"]

FROM maven:3.6.0-jdk-11 AS build  
COPY src /usr/src/app/src  
COPY pom.xml /usr/src/app  
RUN mvn -f /usr/src/app/pom.xml clean package

FROM gcr.io/distroless/java  
COPY --from=build /usr/src/app/target/HaydensPortfolioAPI-0.0.1-SNAPSHOT.jar /usr/app/HaydensPortfolioAPI-0.0.1-SNAPSHOT.jar  
EXPOSE 8080  
ENTRYPOINT ["java","-jar","/usr/app/HaydensPortfolioAPI-0.0.1-SNAPSHOT.jar"]  