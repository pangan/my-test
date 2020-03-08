# FROM prom/prometheus

# FROM grafana/grafana

# ENTRYPOINT ["/run.sh"]

#COPY docker_entrypoint.sh /usr/local/bin/

#RUN chmod +x "/usr/local/bin/docker_entrypoint.sh"
#USER root

#RUN apk add --no-cache curl

#ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]

FROM python:3.7-alpine
WORKDIR /htest
COPY requirements.txt .
COPY docker_entrypoint.sh .
COPY my_app/ ./my_app
RUN pip install -r requirements.txt

ENTRYPOINT ["/bin/sh", "-c", "/htest/docker_entrypoint.sh"]