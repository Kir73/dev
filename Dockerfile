
FROM maven:3.8.6-openjdk-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package
WORKDIR /app
COPY --from=build /app/target/your-app-name.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java1", "-jar", "app.jar"]