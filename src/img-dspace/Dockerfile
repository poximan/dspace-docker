FROM tomcat:8.5.34-jre11
MAINTAINER <donatohugo13@gmail.com>

# ..........................
# config tomcat
# ..........................
ENV CATALINA_OPTS -Xms512M -Xmx1900M -server -XX:+UseParallelGC
ENV CATALINA_PID /usr/local/tomcat/temp/tomcat.pid

COPY ./tomcat/conf /usr/local/tomcat/conf

WORKDIR /usr/local/tomcat
RUN chmod +x bin/*

# ..........................
# instalar maven
# ..........................
RUN apt-get update -qq \
    && apt-get install -y maven \
    && rm -rf /var/cache/apt/*

# ..........................
# instalar ant
# ..........................
RUN apt-get install -y ant
