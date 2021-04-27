FROM bladex/alpine-java:openjdk8-openj9_cn_slim

MAINTAINER bladejava@qq.com

RUN mkdir -p /blade/report

WORKDIR /blade/report

EXPOSE 8108

ADD ./target/blade-report.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=test"]
