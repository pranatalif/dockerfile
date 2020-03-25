FROM picoded/ubuntu-openjdk-8-jdk

ENV SCRAPE_URI 192.168.122.130:9090
ENV TELEMETRY_PATH /prometheus
ENV NGINX_RETRIES 10

RUN apt-get update && apt-get install -y --no-install-recommends curl sudo net-tools iputils-ping apt-utils software-properties-common git wget build-essential lsb-release nano

WORKDIR /usr/src/nginx-exporter

COPY nginx-prometheus-exporter ./

EXPOSE 9113

CMD ["/bin/bash"]
#CMD ["./nginx-prometheus-exporter -nginx.scrape-uri http://192.168.122.5:80/metrics"]


