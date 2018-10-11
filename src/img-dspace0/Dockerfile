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

# ..........................
# instalar dspace
# ..........................
WORKDIR /home
RUN useradd udspace
RUN apt-get install -y git-core

WORKDIR /home/udspace
RUN git clone https://github.com/DSpace/DSpace.git -b dspace-6_x
RUN mv DSpace DSpace-source-code
RUN chown -R udspace:udspace DSpace-source-code

# ..........................
# compilar dspace
# ..........................
WORKDIR /home/udspace/DSpace-source-code
RUN cd /home/udspace/DSpace-source-code
RUN mvn clean package -Dmirage2.on=true
