FROM gwj41/robbie_java:latest
MAINTAINER Wenjun Gu "gwj41@hotmail.com"
ENV REFRESHED_AT 2016-05-09
ENV TOMCAT_VERSION_MAJOR 8
ENV TOMCAT_VERSION_UPDATE 13
ENV TOMCAT_HOME /usr/tomcat
ENV TOMCAT_FOLDER_NAME apache-tomcat-${TOMCAT_VERSION_MAJOR}.5.${TOMCAT_VERSION_UPDATE}
RUN apt-get update && \
wget -q http://mirrors.tuna.tsinghua.edu.cn/tomcat/tomcat-${TOMCAT_VERSION_MAJOR}/v${TOMCAT_VERSION_MAJOR}.5.${TOMCAT_VERSION_UPDATE}/bin/apache-tomcat-${TOMCAT_VERSION_MAJOR}.5.${TOMCAT_VERSION_UPDATE}.tar.gz
RUN tar -zxvf ${TOMCAT_FOLDER_NAME}.tar.gz -C /usr
WORKDIR /usr
RUN mv ${TOMCAT_FOLDER_NAME} tomcat
RUN chmod a+x ${TOMCAT_HOME}/bin/startup.sh && chmod a+x ${TOMCAT_HOME}/bin/shutdown.sh && chmod a+x ${TOMCAT_HOME}/bin/catalina.sh
EXPOSE 8080 8000
ENTRYPOINT ["/usr/tomcat/bin/catalina.sh","run"]
VOLUME ["/usr/tomcat/webapps/logs"]
