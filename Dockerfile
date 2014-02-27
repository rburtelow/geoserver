FROM mattdm/fedora
MAINTAINER Rob Burtelow <rburtelow@gmail.com>

RUN yum -y update
RUN yum -y install java-1.7.0-openjdk-headless.x86_64 tomcat unzip

RUN cd /tmp && curl -L -O http://sourceforge.net/projects/geoserver/files/GeoServer/2.4.4/geoserver-2.4.4-war.zip && unzip geoserver-2.4.4-war.zip && mv geoserver.war /var/lib/tomcat/webapps 

RUN mkdir -p /var/lib/geoserver_data

VOLUME        ["/var/lib/geoserver_data"]

ADD run.sh /tmp/run.sh

RUN chmod +x /tmp/run.sh

ENTRYPOINT ["/tmp/run.sh"]


