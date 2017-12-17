#Imagen Base
FROM centos:7

#Encargado del mantenimiento
MAINTAINER eduardoriveror@gmail.com

#Instalacion de Paquetes
RUN yum -y update && yum -y install \
    wget \
    git \
    mysql \
    tomcat

#Setting Tomcat Variables
ENV TOMCAT_HOME /usr/share/tomcat

#Integration with Systemd. Reference: https://github.com/docker-library/docs/tree/master/centos#systemd-integration
#RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
#systemd-tmpfiles-setup.service ] || rm -f $i; done); \
#rm -f /lib/systemd/system/multi-user.target.wants/*;\
#rm -f /etc/systemd/system/*.wants/*;\
#rm -f /lib/systemd/system/local-fs.target.wants/*; \
#rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
#rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
#rm -f /lib/systemd/system/basic.target.wants/*;\
#rm -f /lib/systemd/system/anaconda.target.wants/*;

#VOLUME [ "/sys/fs/cgroup" ]
#CMD ["/usr/sbin/init"]
#ENV container docker

#RUN systemctl start tomcat

#COPY . /opt
#RUN cd /opt && jar -cvf petclinic.war * && cp petclinic.war /usr/share/tomcat/webapps/
