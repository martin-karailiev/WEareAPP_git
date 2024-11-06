# Use Maven image for building the application
FROM maven:3.8.4-openjdk-17 AS build

# Set the working directory to the root of your application
WORKDIR /app

# Copy the contents of WEareAPP into the working directory
COPY WEareAPP /app

# Build the project using Maven
RUN mvn clean install

# Use a smaller JRE image for running the application
FROM openjdk:17-jdk-slim

# Set the working directory for the application
WORKDIR /app

# Copy the built JAR file from the build stage
COPY --from=build /app/target/*.jar weareapp.jar

# Expose the port the application runs on
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "weareapp.jar"]