#FROM quay.io/prometheus/busybox:latest
FROM picoded/ubuntu-openjdk-8-jdk

RUN apt-get update && apt-get install -y --no-install-recommends curl sudo net-tools iputils-ping apt-utils software-properties-common git wget build-essential lsb-release nano sudo

WORKDIR /usr/src/nginxlog

COPY prometheus-nginxlog-exporter ./
COPY config.yml /etc/
COPY config.hcl /etc/
COPY prometheus-nginxlog-exporter.service /etc/systemd/system/
COPY access.log /var/log/nginx/

EXPOSE 4040

CMD ["/bin/bash"]
#CMD ["/usr/src/nginxlog/prometheus-nginxlog-exporter -config-file /etc/config.yml"]
#CMD ["/usr/src/nginxlog/prometheus-nginxlog-exporter -config-file /etc/config.hcl"]


