#Imagen Base
FROM tomcat:8.0.48	

#Encargado del mantenimiento
MAINTAINER eduardoriveror@gmail.com

COPY spring_petclinic/target/spring-petclinic-1.5.1.war $CATALINA_HOME/webapps/
RUN ./$CATALINA_HOME/bin/startup.sh
