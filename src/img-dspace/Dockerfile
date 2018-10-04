FROM ubuntu:latest
MAINTAINER <donatohugo13@gmail.com>
#ENV DEBIAN_FRONTEND=noninteractive

# se debe hacer update antes de agregar los paquetes adicionales
# porque estos necesitaran paquetes instalados con el primer update
RUN apt-get update -qq \
    && apt-get install -y dirmngr \
    && apt-get install -y apt-utils \
    && rm -rf /var/cache/apt/*

RUN useradd dspace-user

# Instalación JDK
RUN mkdir -p /etc/apt/sources.list.d/
COPY ./*.list /etc/apt/sources.list.d/

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886

RUN apt-get update \
    && yes | apt-get install -y oracle-java8-installer \
    && apt-get install -y oracle-java8-set-default

# Instalación Apache Tomcat
RUN wget http://www-us.apache.org/dist/tomcat/tomcat-8/v8.5.34/bin/apache-tomcat-8.5.34.zip
RUN apt-get install -y unzip
RUN unzip apache-tomcat-8.5.34.zip
RUN mv apache-tomcat-8.5.34 /opt/tomcat

WORKDIR /opt/tomcat
COPY ./tomcat/conf /opt/tomcat/conf
RUN chmod +x bin/*
COPY ./tomcat/tomcat.service /etc/systemd/system/

RUN apt-get install -y systemd \
    && apt-get install -y curl
CMD ["/opt/tomcat/bin/startup.sh"]
