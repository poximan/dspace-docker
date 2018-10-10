docker run -d --rm --name cont-tmp tomcat:8.5.34-jre11
docker cp cont-tmp:/usr/local/tomcat/conf ./img-dspace/tomcat

docker stop cont-tmp
