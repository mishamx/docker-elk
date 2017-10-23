# https://github.com/elastic/logstash-docker
FROM docker.elastic.co/logstash/logstash:5.6.1

ENV ELASTIC_HOST "elasticsearch"
ENV ELASTIC_PORT "9200"
ENV LOGSTASH_PORT "5044"

ENV LS_JAVA_OPTS "-Xmx256m -Xms256m"

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json

RUN logstash-plugin install logstash-filter-json \
        && logstash-plugin install logstash-filter-grok \
        && logstash-plugin install logstash-filter-geoip

COPY config/logstash.yml /usr/share/logstash/config/logstash.yml
COPY pipeline /usr/share/logstash/pipeline
COPY patterns /usr/share/logstash/patterns
COPY templates /usr/share/logstash/templates

