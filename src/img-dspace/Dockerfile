FROM openjdk:8-jdk
MAINTAINER <donatohugo13@gmail.com>

# ----------------------------------------------------------------------
# descargas
# ----------------------------------------------------------------------

# descargar tomcat
# ..........................
WORKDIR /home
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.34/bin/apache-tomcat-8.5.34.zip

# descargar utileria
# ..........................
RUN apt-get update && apt-get install -y \
  unzip \
  git-core \
  maven \
  ant \
  && rm -rf /var/cache/apt/*

# descargar dspace
# ..........................
RUN useradd udspace
WORKDIR /home/udspace
RUN git clone https://github.com/DSpace/DSpace.git -b dspace-6_x

# ----------------------------------------------------------------------
# instalaciones
# ----------------------------------------------------------------------

# ..........................
# instalar dspace
# ..........................
RUN mv DSpace DSpace-source-code
WORKDIR /home/udspace/DSpace-source-code
RUN mvn dependency:copy-dependencies -DoutputDirectory=lib
COPY ./config /home/udspace/DSpace-source-code/dspace/config
WORKDIR /home/udspace
RUN chown -R udspace:udspace DSpace-source-code

# ..........................
# compilar dspace
# ..........................
WORKDIR /home/udspace/DSpace-source-code
RUN chown -R udspace:udspace /home/udspace

USER udspace
RUN mkdir -p /home/udspace/.m2/repository
RUN mvn clean package -Dmirage2.on=true

# instalar tomcat
# ..........................
USER root
WORKDIR /home
RUN unzip apache-tomcat-8.5.34.zip
RUN mv apache-tomcat-8.5.34 /opt/tomcat

# ..........................
# config tomcat
# ..........................
WORKDIR /opt/tomcat
RUN chmod +x bin/*

COPY ./tomcat/conf /opt/tomcat/conf

ENV CATALINA_OPTS -Xms512M -Xmx1900M -server -XX:+UseParallelGC
ENV CATALINA_PID /usr/local/tomcat/temp/tomcat.pid

WORKDIR /opt/tomcat/bin
RUN mkdir -p /usr/local/tomcat/temp/
RUN touch /usr/local/tomcat/temp/tomcat.pid
RUN ./startup.sh

# ..........................
# desplegar dspace
# ..........................
USER root
WORKDIR /home/udspace/DSpace-source-code/dspace/target/dspace-installer
RUN ant fresh_install

# ..........................
# enlazar al contenedor
# ..........................
RUN service tomcat stop
RUN cd /opt/tomcat/webapps
RUN ln -s /home/dspace-base/webapps/xmlui/ xmlui
RUN ln -s /home/dspace-base/webapps/oai/ oai
RUN ln -s /home/dspace-base/webapps/solr/ solr
RUN service tomcat start
