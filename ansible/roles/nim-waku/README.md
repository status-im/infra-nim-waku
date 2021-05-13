# Description

This role provisions a [Nim-Waku](https://github.com/status-im/nim-waku) node which speaks the Waku communication protocol.

# Configuration

The crucial settings are:
```yaml
# Private key which affects enode:// address
nim_waku_node_key: 
# Name of Status eth cluster running status-go
nim_waku_bootstrap_fleet: 'test'
nim_waku_log_level: 'info'
```
You can also enable WebSockets via [WebSockify](https://github.com/novnc/websockify):
```yaml
nim_waku_websockify_enabled: true
nim_waku_websockify_cont_port: 443
nim_waku_websockify_domain: 'hostname.example.org'
nim_waku_websockify_ssl_dir: '/etc/letsencrypt'
nim_waku_websockify_ssl_cert: '/etc/letsencrypt/live/{{ nim_waku_websockify_domain }}/fullchain.pem'
nim_waku_websockify_ssl_key: '/etc/letsencrypt/live/{{ nim_waku_websockify_domain }}/privkey.pem'
```
In this case [LetsEncrypt](https://letsencrypt.org/) is used, but any other certificate would work as long ass the full chain is given to WebSockify.

# Usage

You can re-create containers on the host using:
```
cd /docker/nim-waku-node
docker-compose --compatibility up -d --force-recreate
```
Which will use the `docker-compose.yml` file in that directory.

# Requirements

Due to being part of Status infra this role assumes availability of certain things:

* Docker for running containers
* [Docker user namespace remapping](https://docs.docker.com/engine/security/userns-remap/) with `dockremap` user
* [Watchtower](https://github.com/containrrr/watchtower) for updating Docker images
* The [`iptables-persistent`](https://zertrin.org/projects/iptables-persistent/) module
