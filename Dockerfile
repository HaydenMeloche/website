FROM adoptopenjdk/openjdk11:latest
RUN mkdir /opt/app
COPY target/HaydensPortfolioAPI-0.0.1-SNAPSHOT.jar /opt/app
CMD ["java", "-jar", "/opt/app/HaydensPortfolioAPI-0.0.1-SNAPSHOT.jar"]