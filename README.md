# Description

This repo defines __legacy__ infrastructure for running [nim-waku](https://github.com/waku-org/nwaku) nodes.

Only a single node is kept for the needs of [js-waku](https://github.com/waku-org/js-waku) development.

# Dashboard

You can look up current state of the fleet at: https://fleets.waku.org/

# Discovery

DNS `TXT` ENRTree records exist to discover available fleets:
```
enrtree://ANEDLO25QVUGJOUTQFRYKWX6P4Z4GKVESBMHML7DZ6YK4LGS5FC5O@prod.wakuv2.nodes.status.im
```


# Continuous Integration

Jenkins CI builds can be used to build and deploy new Docker images:

* `wakuv2.prod` - https://ci.infra.status.im/job/nim-waku/job/deploy-v2-prod/

# Repo Usage

For how to use this repo read the [Infra Repo Usage](https://github.com/status-im/infra-docs/blob/master/docs/general/ansible_terraform.md) doc.
