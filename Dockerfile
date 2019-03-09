FROM maven:3.6.0-jdk-11 AS build  
COPY src /usr/src/app/src  
COPY pom.xml /usr/src/app  
RUN mvn -f /usr/src/app/pom.xml clean package

FROM adoptopenjdk/openjdk11:latest
COPY --from=build /usr/src/app/target/HaydensPortfolioAPI-0.0.1-SNAPSHOT.jar /usr/app/HaydensPortfolioAPI-0.0.1-SNAPSHOT.jar  
EXPOSE 8080  
ENTRYPOINT ["java","-jar","/usr/app/HaydensPortfolioAPI-0.0.1-SNAPSHOT.jar"]  