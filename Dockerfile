FROM eclipse-temurin:17-jdk-alpine as build
WORKDIR /workspace/app

COPY gradle gradle
COPY build.gradle settings.gradle gradlew ./
COPY src src

RUN ./gradlew bootJar -x test
RUN mkdir -p build/libs/dependency && (cd build/libs/dependency; jar -xf ../*.jar)

FROM eclipse-temurin:17-jdk-alpine
VOLUME /tmp
COPY /build/libs/*.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]