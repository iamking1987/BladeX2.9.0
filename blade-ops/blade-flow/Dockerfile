FROM adoptopenjdk/openjdk8-openj9:alpine-slim

MAINTAINER smallchill@163.com

RUN mkdir -p /blade/flow

WORKDIR /blade/flow

EXPOSE 8008

ADD ./target/blade-flow.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=test"]
