FROM openjdk:19-jdk-alpine

RUN apk update && apk add bash && apk add curl && apk add gettext

RUN curl -L -o gesyer.jar https://download.geysermc.org/v2/projects/geyser/versions/2.1.1/builds/227/downloads/standalone

COPY ./config.template.yml /config.template.yml

EXPOSE 19132/udp

RUN envsubst < /config.template.yml > /config.yml

CMD ["java", "-jar", "/gesyer.jar"]