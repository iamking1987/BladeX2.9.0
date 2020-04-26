FROM adoptopenjdk/openjdk8-openj9:alpine-slim

MAINTAINER smallchill@163.com

RUN mkdir -p /blade/admin

WORKDIR /blade/admin

EXPOSE 7002

ADD ./target/blade-admin.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=test"]
