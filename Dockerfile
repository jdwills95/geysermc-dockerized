FROM openjdk:19-jdk-alpine

RUN apk update && apk add bash && apk add curl && apk add gettext

#RUN curl -L -o gesyer.jar https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/standalone/build/libs/Geyser-Standalone.jar

#COPY ./config.template.yml /config.template.yml

EXPOSE 19132/udp

#envsubst < /config.template.yml > /config.yml

ENTRYPOINT  cp /config/config.yml / && curl -L -o gesyer.jar https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/standalone/build/libs/Geyser-Standalone.jar && java -jar /gesyer.jar