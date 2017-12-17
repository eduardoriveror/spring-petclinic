#Imagen Base
FROM tomcat:9.0.2	

#Encargado del mantenimiento
MAINTAINER eduardoriveror@gmail.com

#Copiar el archivo compilado en el primer paso
COPY target/spring-petclinic-1.5.1.war $CATALINA_HOME/webapps/

#Iniciar servicio Tomcat
RUN sh $CATALINA_HOME/bin/startup.sh

#Publicar el puerto de tomcat
EXPOSE 8080

#Comando que hace el container
CMD ["catalina.sh", "run"]
