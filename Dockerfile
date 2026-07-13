FROM eclipse-temurin:21-jre-alpine

RUN apk update && apk add bash && apk add curl && apk add gettext

#RUN curl -L -o gesyer.jar https://ci.opencollab.dev/job/GeyserMC/job/Geyser/job/master/lastSuccessfulBuild/artifact/bootstrap/standalone/build/libs/Geyser-Standalone.jar

COPY ./config.template.yml /config.template.yml

EXPOSE 19132/udp

#envsubst < /config.template.yml > /config.yml

ENTRYPOINT ["/bin/bash", "-c", "if [ -f /config/config.yml ]; then cp /config/config.yml /config.yml; else envsubst < /config.template.yml > /config.yml; fi && curl -L -o geyser.jar https://download.geysermc.org/v2/projects/geyser/versions/latest/builds/latest/downloads/standalone && java -jar /geyser.jar"]