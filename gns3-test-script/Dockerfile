FROM picoded/ubuntu-openjdk-8-jdk

USER root

RUN apt-get update && apt-get install -y net-tools sudo iproute git software-properties-common nano wget curl gzip hostname openssl tar telnet

#RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#RUN apt install -y ./google-chrome-stable_current_amd64.deb

WORKDIR /usr/test

COPY config.properties /usr/test
COPY seleniumTesting.jar /usr/test
COPY seleniumTestingWithDriver.jar /usr/test
COPY driver driver

#RUN java -version

CMD ["/bin/bash"]