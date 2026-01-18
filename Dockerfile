# Build Stage
FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Production Stage - Using compatible base image
FROM eclipse-temurin:17-jre
WORKDIR /app

# Best Practice: Run as a non-root user
RUN groupadd -r devopsgroup && useradd -r -g devopsgroup devopsuser

# Copy the JAR from build stage
COPY --from=build /app/target/*.jar app.jar

# Change ownership
RUN chown -R devopsuser:devopsgroup /app

# Switch to non-root user
USER devopsuser

EXPOSE 8080

ENTRYPOINT ["java", "-jar", "app.jar"]