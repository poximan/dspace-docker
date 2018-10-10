FROM postgres:9.6
MAINTAINER <donatohugo13@gmail.com>

# ..........................
# config postgres
# ..........................
RUN mkdir -p /etc/postgresql/9.6/main/

COPY conf/* /etc/postgresql/9.6/main

WORKDIR /etc/postgresql/9.6/main
RUN cat pg_hba.conf.sample > pg_hba.conf
