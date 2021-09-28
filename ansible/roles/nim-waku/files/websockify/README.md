# Description

This `Dockerfile` was used to create the [Websockify](https://github.com/novnc/websockify) image used by [Nim-Waku](https://github.com/status-im/nim-waku) nodes.

The inspiration for it was the [`efrecon` fork](https://github.com/efrecon/websockify/tree/master) of Websockify.

# Usage

```sh
docker build --build-arg VERSION=0.10.0 --tag statusteam/websockify:v0.10.0 .
```
To push to [Docker Hub](https://hub.docker.com/r/statusteam/websockify) simply use:
```sh
docker push statusteam/websockify:v0.10.0
```
