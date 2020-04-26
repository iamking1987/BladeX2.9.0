FROM adoptopenjdk/openjdk8-openj9:alpine-slim

MAINTAINER smallchill@163.com

RUN mkdir -p /blade/user

WORKDIR /blade/user

EXPOSE 8102

ADD ./target/blade-user.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=test"]
