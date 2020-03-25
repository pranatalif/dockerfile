#FROM quay.io/prometheus/busybox:latest
FROM picoded/ubuntu-openjdk-8-jdk

USER root

ENV GOROOT /usr/local/go
ENV GOPATH $HOME/go
ENV PATH $GOPATH/bin:$GOROOT/bin:$PATH

RUN apt-get update && apt-get install -y --no-install-recommends curl sudo net-tools iputils-ping apt-utils software-properties-common git wget build-essential lsb-release nano make wget

RUN wget https://dl.google.com/go/go1.13.4.linux-amd64.tar.gz \
	&& tar -xvf go1.13.4.linux-amd64.tar.gz \
	&& mv go /usr/local
#RUN echo "export GOROOT=/usr/local/go" >> ~/.profile \
	#&& echo "export GOPATH=$HOME/go" >> ~/.profile \
	#&& echo "export PATH=$GOPATH/bin:$GOROOT/bin:$PATH" >> ~/.profile

#RUN echo "export GPG_TTY=$(tty)" >> ~/.profile
#RUN /bin/bash -c "source ~/.profile"
RUN go version
#RUN source $HOME/.profile && go version
RUN go env

WORKDIR /bin
COPY nginx-vts-exporter  /bin/nginx-vts-exporter
COPY docker-entrypoint.sh /bin/docker-entrypoint.sh
RUN chmod +x /bin/nginx-vts-exporter

ENV NGINX_HOST "http://192.168.122.5"
ENV METRICS_ENDPOINT "/metrics"
ENV METRICS_ADDR ":9913"
ENV DEFAULT_METRICS_NS "nginx"

EXPOSE 9913

CMD ["/bin/bash"]
#ENTRYPOINT [ "docker-entrypoint.sh" ]