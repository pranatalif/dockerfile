FROM picoded/ubuntu-openjdk-8-jdk

ENV KEYCLOAK_VERSION 9.0.0
ENV JDBC_POSTGRES_VERSION 42.2.5
ENV JDBC_MYSQL_VERSION 5.1.46
ENV JDBC_MARIADB_VERSION 2.2.3
ENV JDBC_MSSQL_VERSION 7.4.1.jre11

ENV LAUNCH_JBOSS_IN_BACKGROUND 1
ENV PROXY_ADDRESS_FORWARDING false
ENV JBOSS_HOME /opt/jboss/keycloak
ENV JAVA_HOME /usr/lib/jvm/java-8-openjdk-amd64
#ENV KEYCLOAK_IMPORT_REALM ${KEYCLOAK_IMPORT_REALM:-realm-export.json}
ENV KEYCLOAK_IMPORT /opt/jboss/keycloak/realm-export.json
ARG KEYCLOAK_ADMIN_USER=admin
ARG KEYCLOAK_ADMIN_PASS=admin
#ARG KEYCLOAK_IMPORT_REALM

USER root

RUN apt-get update && apt-get install -y net-tools sudo iproute git software-properties-common nano wget curl gzip hostname openssl tar

RUN mkdir /opt/jboss/ && cd /opt/jboss/ && curl -L https://downloads.jboss.org/keycloak/$KEYCLOAK_VERSION/keycloak-$KEYCLOAK_VERSION.tar.gz | tar zx && mv /opt/jboss/keycloak-$KEYCLOAK_VERSION /opt/jboss/keycloak

#ADD tools /opt/jboss/tools
COPY createuser.sh /opt/jboss/keycloak
COPY realm-export.json /opt/jboss/keycloak
COPY keycloak-admin-cli-8.0.1.jar /opt/jboss/keycloak
COPY docker-entrypoint.sh /opt/jboss/keycloak

#RUN /opt/jboss/tools/build-keycloak.sh

RUN cd $JBOSS_HOME/bin && ./add-user-keycloak.sh -r master -u ${KEYCLOAK_ADMIN_USER} -p ${KEYCLOAK_ADMIN_PASS}
#RUN /opt/jboss/keycloak/bin/add-user.sh -u ${KEYCLOAK_ADMIN_USER} -p ${KEYCLOAK_ADMIN_PASS}
RUN cd $JBOSS_HOME/bin && ./add-user-keycloak.sh -r demo -u aalif -p aalif


#USER 1000

EXPOSE 8080
EXPOSE 8443

CMD ["/bin/bash"]
#ENTRYPOINT [ "/opt/jboss/keycloak/docker-entrypoint.sh" ]
#CMD ["-b", "0.0.0.0", "-Dkeycloak.import=/opt/jboss/keycloak/realm-export.json"]

#CMD ["-b", "0.0.0.0"]
#CMD ["-b", "0.0.0.0", "-Dkeycloak.profile.feature.docker=enabled"]
#CMD ["-b", "0.0.0.0", "-bmanagement", "0.0.0.0", "-Dkeycloak.profile.feature.docker=enabled -Dkeycloak.import=/opt/jboss/keycloak/realm-export.json"]
#CMD ["/sbin/my_init", "/bin/bash"]

#-Dkeycloak.migration.action=import
#-Dkeycloak.migration.provider=singleFile
#-Dkeycloak.migration.file=<FILE TO IMPORT>
#-Dkeycloak.migration.strategy=OVERWRITE_EXISTING

#-Dkeycloak.migration.action=import
#-Dkeycloak.migration.provider=singleFile
#-Dkeycloak.migration.file=master-realm.json

#source: jimmidyson/keycloak-openshift
