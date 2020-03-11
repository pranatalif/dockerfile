FROM picoded/ubuntu-openjdk-8-jdk

RUN apt-get update && apt-get install -y --no-install-recommends curl sudo net-tools iputils-ping apt-utils software-properties-common git wget build-essential lsb-release nano

WORKDIR /usr/src/node-exporter

COPY node_exporter ./
RUN pwd
RUN ls


EXPOSE 9100

CMD ["/bin/bash"]
#CMD ["./node_exporter"]

