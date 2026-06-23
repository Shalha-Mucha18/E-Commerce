FROM eclipse-temurin:21-jdk AS builder


WORKDIR /user/src/app/


COPY gradlew* settings.gradle* build.gradle .
COPY ./gradle ./gradle

RUN chmod +x ./gradlew
RUN ./gradlew
RUN ./gradlew downloadRepos


COPY . .

RUN chmod +x ./gradlew
RUN ./gradlew installDist -PprotoSourceDir=./proto


FROM eclipse-temurin:21-jre

COPY --from=builder /usr/src/app/ ./

ENV AD_PORT 9099
ENTRYPOINT ["./build/install/opentelemetry-demo-ad/bin/Ad"]


