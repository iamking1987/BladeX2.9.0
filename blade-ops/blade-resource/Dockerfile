FROM bladex/alpine-java:openjdk8-openj9_cn_slim
MAINTAINER bladejava@qq.com

RUN mkdir -p /blade/resource

WORKDIR /blade/resource

EXPOSE 8010

ADD ./target/blade-resource.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=prod"]
