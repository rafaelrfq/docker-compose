# Archivo que representa la información para la creación de
# una imagen para Docker, indicando todos los parametros necesarios.

# El comando FROM indica la imagen base.
FROM adoptopenjdk/openjdk11:alpine-jre

# Quien mantiene la versión.
LABEL maintainer="Rafael Felipe <20100748@ce.pucmm.edu.do>"

# forma estandar para cambiar la configuracion
ENV spring.datasource.url='jdbc:mysql://192.168.77.10:3306/polls'
ENV spring.datasource.username='root'
ENV spring.datasource.password='12345678'

# Añadiendo el punto de montaje en el host
# Por defecto Tomcat crea los archivo temporales en esa ruta,
# lo habilitamos para ver los log, no es necesario para nuestro ejemplo.
VOLUME /tmp

# Puertos que estarán disponibles de nuestra aplicación.
EXPOSE 8080

# Copiando el archivo jar generado luego de la ejecución del comando
# gradle task bootjar, se crean el jar y se copia a la imagen.
COPY /build/libs/*.jar polls-dc.jar

#Comando que se ejecuta una vez es iniciada la aplicación.
ENTRYPOINT ["java", "-jar", "polls-dc.jar"]