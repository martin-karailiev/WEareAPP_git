# Use a base image with JDK
FROM maven:3.8.4-openjdk-17 AS build

# Set the working directory
WORKDIR /app

# Copy the application files
COPY . .

# Build the project
RUN mvn -f app/pom.xml clean install

# Start from a smaller JRE image for running the app
FROM openjdk:17-jdk-slim

# Set the working directory for the application
WORKDIR /app

# Copy the built JAR file from the build image
COPY --from=build /app/app/target/*.jar weareapp.jar

# Expose the port your application runs on (default Spring Boot is 8080)
EXPOSE 8080

# Run the Spring Boot application
ENTRYPOINT ["java", "-jar", "weareapp.jar"]