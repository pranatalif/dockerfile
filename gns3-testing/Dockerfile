FROM ubuntu:xenial

RUN apt-get update && apt-get install -y --no-install-recommends curl sudo net-tools iputils-ping apt-utils software-properties-common git wget build-essential lsb-release
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN apt-get update && apt-get install -y nodejs 


WORKDIR /usr/src/app

COPY package*.json ./

RUN npm install


COPY app2.js ./
COPY public public
COPY keycloak1.json ./
COPY keycloak.json ./
COPY app.js ./
COPY app.sh ./


EXPOSE 3000

CMD [ "sh", "./app.sh"]

