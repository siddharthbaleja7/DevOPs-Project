# Build Stage
FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Production Stage
FROM eclipse-temurin:17-jre-alpine
WORKDIR /app
# Best Practice: Run as a non-root user
RUN addgroup -S devopsgroup && adduser -S devopsuser -G devopsgroup
USER devopsuser
COPY --from=build /app/target/*.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]