FROM picoded/ubuntu-openjdk-8-jdk

#ENV GF_AUTH_DISABLE_LOGIN_FORM "true"
#ENV GF_AUTH_ANONYMOUS_ENABLED "true"
#ENV GF_AUTH_ANONYMOUS_ORG_ROLE "Admin"

WORKDIR /usr/src/

RUN apt-get update && apt-get install -y --no-install-recommends curl apt-transport-https sudo net-tools iputils-ping apt-utils software-properties-common git wget build-essential lsb-release nano

#RUN wget -q -O - https://packages.grafana.com/gpg.key | sudo apt-key add -
#RUN add-apt-repository "deb https://packages.grafana.com/oss/deb stable main"
#RUN apt-get update
#RUN apt-get install grafana

RUN wget https://dl.grafana.com/oss/release/grafana-6.6.2.linux-amd64.tar.gz
RUN tar -zxvf grafana-6.6.2.linux-amd64.tar.gz && mv grafana-6.6.2 grafana

#RUN pwd
#RUN ls /usr/src/
#RUN ls /usr/src/grafana/conf/

RUN rm /usr/src/grafana/conf/defaults.ini /usr/src/grafana/conf/provisioning/datasources/sample.yaml /usr/src/grafana/conf/provisioning/dashboards/sample.yaml
COPY defaults.ini /usr/src/grafana/conf/
COPY datasources.yaml /usr/src/grafana/conf/provisioning/datasources/
COPY dashboard.yaml /usr/src/grafana/conf/provisioning/dashboards/
#COPY docker_dashboard-893.json /usr/src/grafana/conf/provisioning/dashboards/
#COPY docker-and-os-metrics-10566.json /usr/src/grafana/conf/provisioning/dashboards/
#COPY docker-and-os-metrics-10566.json /usr/src/grafana/public/dashboards/


#COPY node_exporter ./
#RUN pwd


EXPOSE 3000

CMD ["/bin/bash"]
#CMD ["/usr/src/grafana/bin/grafana-server", "--config=/usr/src/grafana/conf/defaults.ini", "--homepath=/usr/src/grafana/"]

