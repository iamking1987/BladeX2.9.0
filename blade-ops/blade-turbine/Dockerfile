FROM bladex/alpine-java:openjdk8-openj9_cn_slim

MAINTAINER bladejava@qq.com

RUN mkdir -p /blade/turbine

WORKDIR /blade/turbine

EXPOSE 7003

ADD ./target/blade-turbine.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=test"]
