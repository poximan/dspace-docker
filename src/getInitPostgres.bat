docker run -d --rm --name cont-tmp postgres:9.6
docker cp cont-tmp:/usr/share/postgresql/9.6/pg_hba.conf.sample ./img-db/conf

docker stop cont-tmp
