#Imagen Base
FROM centos:7

#Encargado del mantenimiento
MAINTAINER eduardoriveror@gmail.com

#Instalacion de Paquetes
RUN yum -y update && yum -y install \
    wget \
    git \
    mysql \
    java-1.8.0-openjdk.x86_64 \
    java-1.8.0-openjdk-devel.x86_64 \
    tomcat

#Installing Java
#RUN cd /opt \
#	&& wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u151-b12/e758a0de34e24606bca991d704f6dcbf/jdk-8u151-linux-x64.tar.gz" \
#	&& tar xzf jdk-8u151-linux-x64.tar.gz \
#	&& cd /opt/jdk1.8.0_151/ \
#	&& alternatives --install /usr/bin/java java /opt/jdk1.8.0_151/bin/java 2

#Instalar Maven
RUN cd /opt && wget http://www-eu.apache.org/dist/maven/maven-3/3.5.2/binaries/apache-maven-3.5.2-bin.tar.gz \
    && tar xzf apache-maven-3.5.2-bin.tar.gz && ln -s apache-maven-3.5.2  maven

#Declarando variable path de maven
ENV PATH $PATH:/opt/maven/bin

#Declarando variable home de java
ENV JAVA_HOME /usr/lib/jvm/java-1.8.0-openjdk

#Setting Tomcat Variables
ENV TOMCAT_HOME /usr/share/tomcat

#Integration with Systemd. Reference: https://github.com/docker-library/docs/tree/master/centos#systemd-integration
RUN (cd /lib/systemd/system/sysinit.target.wants/; for i in *; do [ $i == \
systemd-tmpfiles-setup.service ] || rm -f $i; done); \
rm -f /lib/systemd/system/multi-user.target.wants/*;\
rm -f /etc/systemd/system/*.wants/*;\
rm -f /lib/systemd/system/local-fs.target.wants/*; \
rm -f /lib/systemd/system/sockets.target.wants/*udev*; \
rm -f /lib/systemd/system/sockets.target.wants/*initctl*; \
rm -f /lib/systemd/system/basic.target.wants/*;\
rm -f /lib/systemd/system/anaconda.target.wants/*;

VOLUME [ "/sys/fs/cgroup" ]
CMD ["/usr/sbin/init"]
ENV container docker

#RUN systemctl start tomcat

COPY . /opt
RUN cd /opt && jar -cvf petclinic.war * && cp petclinic.war /usr/share/tomcat/webapps/
