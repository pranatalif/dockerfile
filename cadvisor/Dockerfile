#builder
FROM arm32v7/golang:1.13.8-buster AS builder

ENV CADVISOR_VERSION "v0.34.0"

RUN apt-get update && apt-get install -y git dmsetup && apt-get clean

RUN git clone --branch ${CADVISOR_VERSION} https://github.com/google/cadvisor.git /go/src/github.com/google/cadvisor

WORKDIR /go/src/github.com/google/cadvisor

RUN pwd
RUN ls -la

RUN make build

RUN pwd
RUN ls -la

#usage
FROM arm32v7/debian

RUN pwd
RUN ls -la

RUN apt-get update && apt-get install -y --no-install-recommends curl sudo net-tools iputils-ping apt-utils software-properties-common git wget build-essential lsb-release && apt-get clean

COPY --from=builder /go/src/github.com/google/cadvisor/cadvisor /usr/bin/cadvisor

VOLUME /:/rootfs:ro
VOLUME /var/run:/var/run:ro
VOLUME /sys:/sys:ro
VOLUME /var/lib/docker/:/var/lib/docker:ro
VOLUME /dev/disk/:/dev/disk:ro

EXPOSE 8080

CMD ["/usr/bin/cadvisor", "-logtostderr"]

#ENTRYPOINT ["/usr/src/cadvisor", "-logtostderr", "--privileged=true", "--volume=/:/rootfs:ro", "--volume=/var/run:/var/run:ro", "--volume=/sys:/sys:ro", "--volume=/var/lib/docker/:/var/lib/docker:ro", "--volume=/dev/disk/:/dev/disk:ro"]

#source: https://github.com/Budry/cadvisor-arm/blob/v0.30.2/Dockerfile