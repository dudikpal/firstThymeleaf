FROM openjdk:17-jdk-alpine as builder
WORKDIR application
COPY target/firstThymeleaf-0.0.1-SNAPSHOT.jar app.jar
RUN java -Djarmode=layertools -jar app.jar extract

FROM openjdk:17-jdk-alpine
WORKDIR application
COPY --from=builder application/dependencies/ ./dependencies/
COPY --from=builder application/snapshot-dependencies/ ./snapshot-dependencies/
COPY --from=builder application/spring-boot-loader/ ./spring-boot-loader/
COPY --from=builder application/application/ ./application/
ENTRYPOINT ["java", "org.springframework.boot.loader.JarLauncher"]