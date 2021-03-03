#若构建后验证码接口依旧报错可以将FROM改为如下两种
#1.FROM bladex/alpine-java:8_server-jre_cn_unlimited
#2.FROM adoptopenjdk/openjdk8-openj9:jdk8u275-b01_openj9-0.23.0-alpine-slim
#第2点的最新tag可以到该地址查询：https://hub.docker.com/r/adoptopenjdk/openjdk8-openj9/tags?page=1&ordering=last_updated&name=alpine-slim
FROM adoptopenjdk/openjdk8-openj9:alpine-slim

MAINTAINER smallchill@163.com

#验证码字体包
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories
RUN set -xe && apk --no-cache add ttf-dejavu fontconfig

RUN mkdir -p /blade/auth

WORKDIR /blade/auth

EXPOSE 8100

ADD ./target/blade-auth.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=test"]
