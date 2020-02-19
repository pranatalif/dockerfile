FROM ubuntu:16.04

RUN apt-get update \
    && apt-get install -y nginx certbot net-tools iputils-ping apt-utils apt-transport-https ca-certificates sudo software-properties-common nano curl git wget build-essential automake aufs-tools systemd \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && echo "daemon off;" >> /etc/nginx/nginx.conf

ENV NGINX_HOME /etc/nginx

COPY proxy.conf $NGINX_HOME/conf.d/
ADD default $NGINX_HOME/sites-available/default

RUN cp $NGINX_HOME/sites-available/default $NGINX_HOME/sites-available/default-backup && \
	cp $NGINX_HOME/sites-available/default $NGINX_HOME/sites-available/aalif && \
	ln -s $NGINX_HOME/sites-available/aalif $NGINX_HOME/sites-enabled/aalif && \
	rm /etc/nginx/sites-enabled/default

COPY hosts /tmp/
#RUN cat /tmp/hosts >> /etc/hosts
#RUN cat /tmp/hosts
#RUN cat /etc/hosts
RUN ls -la
RUN nginx -t

EXPOSE 8088
CMD cat /tmp/hosts >> /etc/hosts; nginx

#source: https://serversforhackers.com/c/dckr-nginx-image