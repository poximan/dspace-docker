docker run -d --name cont_tmp --rm src_dspace
docker cp cont_tmp:/opt/tomcat/conf ./img-dspace/tomcat

docker stop cont_tmp
