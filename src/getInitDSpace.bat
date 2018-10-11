docker run -d --rm --name cont-tmp src_rdi:latest
docker cp cont-tmp:/home/udspace/DSpace-source-code/dspace/config ./img-dspace/

docker stop cont-tmp
