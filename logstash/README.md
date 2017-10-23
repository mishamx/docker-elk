Logstash for Nginx and other
----------------------------

How to use?
===========

### Run logstash

In nginx logs directory

```bash
docker run --rm -e ELASTIC_HOST='172.17.0.1' mishamx/logstash:latest
```

Environment
===========

| ENV           | Default  |
|---------------|----------|
|`ELASTIC_HOST` | elastic  |
|`ELASTIC_PORT` |   9200   |
|`LOGSTASH_PORT`|   5044   |

Docker Compose
==============

```
version: '3.3'

services:

    filebeat_nginx:
        image: mishamx/logstash:latest
        environment:
          ELASTIC_HOST: "172.17.0.1"
          ELASTIC_PORT: "9200"
          LOGSTASH_PORT: "5044"
```

