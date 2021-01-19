FROM adoptopenjdk/openjdk8-openj9:alpine-slim

MAINTAINER smallchill@163.com

#字体包
#字体构建慢解决方案：https://sns.bladex.vip/q-3090.html
RUN apk add --update font-adobe-100dpi ttf-dejavu fontconfig

RUN mkdir -p /blade/report

WORKDIR /blade/report

EXPOSE 7003

ADD ./target/blade-report.jar ./app.jar

ENTRYPOINT ["java", "-Djava.security.egd=file:/dev/./urandom", "-jar", "app.jar"]

CMD ["--spring.profiles.active=test"]
