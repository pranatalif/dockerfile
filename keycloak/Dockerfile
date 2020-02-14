FROM picoded/ubuntu-openjdk-8-jdk


ENV KEYCLOAK_VERSION 8.0.0
# Enables signals getting passed from startup script to JVM
# ensuring clean shutdown when container is stopped.
ENV LAUNCH_JBOSS_IN_BACKGROUND 1
ARG KEYCLOAK_ADMIN_USER=admin
ARG KEYCLOAK_ADMIN_PASS=admin
ARG KEYCLOAK_IMPORT_REALM
ENV KEYCLOAK_IMPORT_REALM ${KEYCLOAK_IMPORT_REALM:-realm-export.json}

USER root

#RUN cat /etc/network/interfaces

RUN apt-get update && apt-get install -y net-tools sudo iproute git software-properties-common nano wget curl

RUN mkdir /opt/jboss/ && cd /opt/jboss/ && curl -L https://downloads.jboss.org/keycloak/$KEYCLOAK_VERSION/keycloak-$KEYCLOAK_VERSION.tar.gz | tar zx && mv /opt/jboss/keycloak-$KEYCLOAK_VERSION /opt/jboss/keycloak

ENV JBOSS_HOME /opt/jboss/keycloak

ADD docker-entrypoint.sh /opt/jboss/

#ADD setLogLevel.xsl /opt/jboss/keycloak/
#RUN java -jar /usr/share/java/saxon.jar -s:/opt/jboss/keycloak/standalone/configuration/standalone.xml -xsl:/opt/jboss/keycloak/setLogLevel.xsl -o:/opt/jboss/keycloak/standalone/configuration/#standalone.xml
#RUN sed -i 's/\(logger.handlers=CONSOLE\),FILE/\1/' keycloak/standalone/configuration/logging.properties

COPY createuser.sh /opt/jboss/keycloak
COPY realm-export.json /opt/jboss/keycloak
COPY keycloak-admin-cli-8.0.1.jar /opt/jboss/keycloak

RUN cat /etc/network/interfaces

RUN cd $JBOSS_HOME/bin && ./add-user-keycloak.sh -u ${KEYCLOAK_ADMIN_USER} -p ${KEYCLOAK_ADMIN_PASS} -r master
#RUN /opt/jboss/keycloak/bin/add-user.sh -u ${KEYCLOAK_ADMIN_USER} -p ${KEYCLOAK_ADMIN_PASS}


#USER jboss

EXPOSE 8080

ENTRYPOINT [ "/opt/jboss/docker-entrypoint.sh" ]

CMD ["-b", "0.0.0.0", "-Dkeycloak.import=/opt/jboss/keycloak/${KEYCLOAK_IMPORT_REALM}"]
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