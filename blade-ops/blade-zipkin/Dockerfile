FROM adoptopenjdk/openjdk8-openj9:alpine-slim

MAINTAINER smallchill@163.com

RUN mkdir -p /blade/zipkin

WORKDIR /blade/zipkin

EXPOSE 9411

ADD ./target/blade-zipkin.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=test"]
