# Docker Compose Example:

```
version: "3.8"
services:    
    geyser:
        image: darthmanatee/geysermcdockerized:latest
        container_name: geyser
        ports:
          - 19133:19132/udp
        volumes:
          - /home/user/geyser-configs/geyser:/config
        restart: unless-stopped
    geyserfloodgate:
        image: darthmanatee/geysermcdockerized:latest
        container_name: gesyerfloodgate
        ports:
          - 19132:19132/udp
        volumes:
          - /home/user/minecraft-key:/keylocation
          - /home/user/geyser-configs/geyserfloodgate:/config
        restart: unless-stopped
```

Docker Link: https://hub.docker.com/repository/docker/darthmanatee/geysermcdockerized/general
