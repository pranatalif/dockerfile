FROM picoded/ubuntu-openjdk-8-jdk

WORKDIR /usr/src/alertmanager

RUN apt-get update && apt-get install -y --no-install-recommends curl sudo net-tools iputils-ping apt-utils software-properties-common git wget build-essential lsb-release nano

COPY alertmanager ./
COPY amtool ./
COPY alertmanager.yml ./
COPY alert.rules ./

EXPOSE 9093

CMD ["/bin/bash"]
#ENTRYPOINT ["./alertmanager"]
#CMD ["--config.file=/usr/src/alertmanager/alertmanager.yml", "--storage.path=/usr/src/alertmanager"]

