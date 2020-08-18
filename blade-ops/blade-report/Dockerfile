FROM adoptopenjdk/openjdk8-openj9:alpine-slim

MAINTAINER smallchill@163.com

RUN mkdir -p /blade/report

WORKDIR /blade/report

EXPOSE 7003

ADD ./target/blade-report.jar ./app.jar

RUN apk add --update font-adobe-100dpi ttf-dejavu fontconfig

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=test"]
