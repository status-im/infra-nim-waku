# Description

This role configures a [`chat2bridge`](https://github.com/status-im/infra-wakuv2/commit/0532dbd7) node which communicates with [MatterBridge](https://github.com/42wim/matterbridge) instance which expoes it's [API](https://github.com/42wim/matterbridge/wiki/API) in order to bridge Waku v2 channels with other chat services like Discord.
# Configuration

```yaml
# Ports
chat2bridge_p2p_tcp_port: 9000
chat2bridge_p2p_udp_port: 9000
chat2bridge_rpc_tcp_port: 8546

# MatterBridge instance info
chat2bridge_mb_host_address: 10.10.0.99 # node-01.do-ams3.bridge.misc.wg
chat2bridge_mb_host_port: 4242
chat2bridge_mb_gateway: 'waku'
```

# Management

Node is managed via [Docker Compose](https://docs.docker.com/compose/):
```
admin@node-01.gc-us-central1-a.wakuv2.prod:/docker/chat2bridge % docker-compose ps                    
   Name                  Command               State                                 Ports                               
-------------------------------------------------------------------------------------------------------------------------
chat2bridge   chat2bridge --mb-host-addr ...   Up      30303/tcp, 60000/tcp, 8545/tcp, 0.0.0.0:8546->8546/tcp,           
                                                       0.0.0.0:9000->9000/tcp, 0.0.0.0:9000->9000/udp                    

admin@node-01.gc-us-central1-a.wakuv2.prod:/docker/chat2bridge % docker-compose pull
Pulling node ... done

admin@node-01.gc-us-central1-a.wakuv2.prod:/docker/chat2bridge % docker-compose up --force-recreate -d
Recreating chat2bridge ... done
```
