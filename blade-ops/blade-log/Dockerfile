FROM bladex/alpine-java:openjdk8-openj9_cn_slim

MAINTAINER bladejava@qq.com

RUN mkdir -p /blade/log

WORKDIR /blade/log

EXPOSE 8103

ADD ./target/blade-log.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=test"]
