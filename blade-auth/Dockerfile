FROM adoptopenjdk/openjdk8-openj9:alpine-slim

MAINTAINER smallchill@163.com

#验证码字体包
RUN set -xe \
&& apk --no-cache add ttf-dejavu fontconfig

RUN mkdir -p /blade/auth

WORKDIR /blade/auth

EXPOSE 8100

ADD ./target/blade-auth.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=test"]
