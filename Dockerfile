FROM openjdk:19-jdk-alpine

RUN apk update && apk add bash && apk add curl && apk add gettext

#ENVS
ENV USE_FLOODGATE FALSE

#GEYSER ENVS
ENV BEDROCK_ADDRESS 0.0.0.0
ENV BEDROCK_PORT 19132
ENV BEDROCK_CLONE_REMOTE_PORT false
ENV BEDROCK_MOTD1 "Geyser"
ENV BEDROCK_MOTD2 "Another Geyser server."
ENV BEDROCK_SERVER_NAME "Geyser"
ENV BEDROCK_COMPRESSION_LEVEL 6
ENV BEDROCK_ENABLE_PROXY_PROTOCOL false
ENV REMOTE_ADDRESS auto
ENV REMOTE_PORT 25565
ENV REMOTE_AUTH_TYPE online
ENV REMOTE_ALLOW_PASSWORD_AUTHENTICATION true
ENV REMOTE_USE_PROXY_PROTOCOL false
ENV REMOTE_FORWARD_HOSTNAME false
ENV FLOODGATE_KEY_FILE /keylocation/key.pem
ENV SAVED_USER_LOGINS - ThisExampleUsernameShouldBeLongEnoughToNeverBeAnXboxUsername
ENV PENDING_AUTHENTICATION_TIMEOUT 120
ENV COMMAND_SUGGESTIONS true
ENV PASSTHROUGH_MOTD false
ENV PASSTHROUGH_PROTOCOL_NAME false
ENV PASSTHROUGH_PLAYER_COUNTS false
ENV LEGACY_PING_PASSTHROUGH false
ENV PING_PASSTHROUGH_INTERVAL 3
ENV FORWARD_PLAYER_PING false
ENV MAX_PLAYERS 100
ENV DEBUG_MODE false
ENV ALLOW_THIRD_PARTY_CAPES false
ENV ALLOW_THIRD_PARTY_EARS false
ENV SHOW_COOLDOWN title
ENV SHOW_COORDINATES true
ENV DISABLE_BEDROCK_SCAFFOLDING false
ENV ALWAYS_QUICK_CHANGE_ARMOR false
ENV EMOTE_OFFHAND_WORKAROUND "disabled"
ENV CACHE_IMAGES 0
ENV ALLOW_CUSTOM_SKULLS true
ENV MAX_VISIBLE_CUSTOM_SKULLS 128
ENV CUSTOM_SKULL_RENDER_DISTANCE 32
ENV ADD_NON_BEDROCK_ITEMS true
ENV ABOVE_BEDROCK_NETHER_BUILDING false
ENV FORCE_RESOURCE_PACKS true
ENV XBOX_ACHIEVEMENTS_ENABLED false
ENV LOG_PLAYER_IP_ADDRESSES true
ENV NOTIFY_ON_NEW_BEDROCK_UPDATE true
ENV UNUSABLE_SPACE_BLOCK minecraft:barrier
ENV METRICS_ENABLED true
ENV METRICS_UUID f9aaa8e3-ccf8-4bf8-83de-69fbd531054c
ENV SCOREBOARD_PACKET_THRESHOLD 20
ENV ENABLE_PROXY_CONNECTIONS false
ENV MTU 1400
ENV USE_DIRECT_CONNECTION true
ENV DISABLE_COMPRESSION true
ENV CONFIG_VERSION 4

RUN curl -L -o gesyer.jar https://download.geysermc.org/v2/projects/geyser/versions/2.1.1/builds/227/downloads/standalone

COPY ./config.template.yml /config.template.yml

EXPOSE ${BEDROCK_PORT}/udp

RUN envsubst < /config.template.yml > /config.yml

CMD ["java", "-jar", "/gesyer.jar"]