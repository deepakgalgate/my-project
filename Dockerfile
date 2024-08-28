FROM openjdk:8-jdk-alpine
RUN addgroup -S spring && adduser -S spring -G spring
USER spring:spring
ARG DEPENDENCY=build
COPY ${DEPENDENCY}/lib /app/lib
COPY ${DEPENDENCY}/classes /app
ENTRYPOINT ["java","-cp","app:app/lib/*","com.githubaction.myproject.MyProjectApplication"]