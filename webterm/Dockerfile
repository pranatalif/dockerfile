#Content of the entire Dockerfile
#Dockerfile built to run Qxf2 POM tests and view the test running across chrome/firefox using VNC viewer
FROM qxf2rohand/qxf2_pom_essentials
 
USER root

#Upgrade pip, install Git & VNC 	
RUN pip install --upgrade pip \
        && apt-get update \
	&& apt-get install -y git x11vnc 
 
# Add entrypoint.sh and other available files to image
ADD . /usr/webterm
 
#Change directory and clone Qxf2 Public POM repo
RUN cd /usr/webterm \
	&& git clone https://github.com/qxf2/qxf2-page-object-model.git \
	&& mv qxf2-page-object-model web term
 
#Set envirnmental variable for display	
ENV DISPLAY :20
 
#Set working directory
WORKDIR /usr/webterm/webterm
 
#Install requirements using requirements.txt 
RUN pip install -r requirements.txt 
 
#Provide read, write and execute permissions for entrypoint.sh and also take care of '\r' error which raised when someone uses notepad or note++ for editing in Windows.
RUN chmod 755 /usr/webterm/entrypoint.sh \
	&& sed -i 's/\r$//' /usr/webterm/entrypoint.sh
 
#Expose port 5920 to view display using VNC Viewer
EXPOSE 5920
 
#Execute entrypoint.sh at start of container
ENTRYPOINT ["/usr/webterm/entrypoint.sh"]