FROM picoded/ubuntu-openjdk-8-jdk

RUN apt-get update && apt-get install -y --no-install-recommends curl sudo net-tools iputils-ping apt-utils software-properties-common git wget build-essential lsb-release nano

WORKDIR /usr/src/

RUN wget https://github.com/prometheus/prometheus/releases/download/v2.16.0/prometheus-2.16.0.linux-amd64.tar.gz && \
    tar -zxvf prometheus-2.16.0.linux-amd64.tar.gz && \
    mv prometheus-2.16.0.linux-amd64/ prometheus/ && \
    rm prometheus/prometheus.yml && \
    rm -rf prometheus-2.16.0.linux-amd64.tar.gz

#change this to deploy prom in gns3 or local, and --config.file in CMD below 
COPY prometheus.yml /usr/src/prometheus
COPY local-prom.yml /usr/src/prometheus

COPY alert.rules /usr/src/prometheus

EXPOSE 9090

CMD ["/bin/bash"]
#CMD [ "/usr/src/prometheus/prometheus", "--config.file=/usr/src/prometheus/prometheus.yml", "--web.console.templates=/usr/src/prometheus/consoles", "--web.console.libraries=/usr/src/prometheus/console_libraries"]

