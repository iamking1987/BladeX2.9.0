FROM bladex/alpine-java:8_server-jre_cn_unlimited

MAINTAINER bladejava@qq.com

RUN mkdir -p /blade/plugin/workflow

WORKDIR /blade/plugin/workflow

EXPOSE 8009

ADD ./target/blade-workflow.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=prod"]
