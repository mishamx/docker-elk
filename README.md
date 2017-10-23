# docker-elk
Elk cluster in docker stack

## Docker Compose File

```yaml
version: '3.3'

services:

    elasticsearch:
        image: mishamx/elk:elasticsearch-5.6.1
        volumes:
          - esdata1:/usr/share/elasticsearch/data
        ports:
          - "9200"
          - "9300"
        environment:
          ES_JAVA_OPTS: "-Xms1152M -Xmx1152M"
          XPACK_MONITORING_ENABLED: "false"
        networks:
          - elk

    logstash:
        image: mishamx/elk:logstash-5.6.1
        ports:
          - "5000"
          - "5044"
        environment:
          LS_JAVA_OPTS: "-Xmx256m -Xms256m"
          ELASTIC_HOST: "elasticsearch"
          ELASTIC_PORT: "9200"
          LOGSTASH_PORT: "5044"
        networks:
          - elk
        depends_on:
          - elasticsearch

    kibana:
        image: mishamx/elk:kibana-5.6.1
        ports:
          - "5601"
        environment:
          LS_JAVA_OPTS: "-Xmx256m -Xms256m"
          ELASTIC_HOST: "elasticsearch"
          ELASTIC_PORT: "9200"
          ELASTICSEARCH_URL: "http://elasticsearch:9200"
          XPACK_MONITORING_ENABLED: "false"
        networks:
          - elk
        depends_on:
          - elasticsearch

    nginx:
        image: mishamx/elk:nginx-5.6.1
        ports:
          - "80:80"
        networks:
          - elk
        environment:
          KIBANA_URL: "http://kibana:5601"
          AUTH_USER: username
          AUTH_PASS: password
        depends_on:
          - kibana

networks:
    elk:

volumes:
  esdata1:
    driver: local
```