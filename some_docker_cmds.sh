#######################
https://hostpresto.com/community/tutorials/networking-with-docker-containers/
https://docs.docker.com/samples/
https://github.com/docker/labs/blob/master/12factor/README.md
https://chrissainty.com/containerising-blazor-applications-with-docker-containerising-a-blazor-webassembly-app/
https://www.pluralsight.com/tech-blog/containerizing-blazor-apps/
#######################



#######################
!/bin/bash
set -e
FUN_SQL2=" CREATE OR REPLACE FUNCTION insert_event(text) RETURNS integer AS \\$BODY\\$ DECLARE ret INTEGER; begin select $1 into ret; RETURN ret;
end; \\$BODY\\$ LANGUAGE 'plpgsql' VOLATILE COST 100; "
#######################
add function to DB
#######################
docker exec -it db_container sh -c "psql -U postgres -d db_name -c \"$FUN_SQL2\" ";

#######################



############################################################
http://www.willhoeft-it.com/2016/06/03/docker-compose.html
############################################################
git clone myService@github.com; cd myService
docker build --tag myServiceImage .
docker run --name myServiceContainer myServiceImage
############################################################


mit pg setupscripte postgres füllen

hostname: POSTGRES_DB


https://docs.docker.com/compose/gettingstarted/#step-3-define-services-in-a-compose-file

docker system prune -a


docker exec -it 7eaf0c2b7bf76b963abbf8af81c450242e7995456ce354a458bda93b9f04b0cb /bin/sh; exit
docker exec -it postgresOnDocker psql -U postgres
docker exec -it pgdocker bash

docker pull postgres
docker pull dpage/pgadmin4


docker stop postgres
docker stop postgredOnDocker

docker run -it 974b19ca0699 sh
docker run --name postgredOnDocker -e POSTGRES_PASSWORD=1qa2ws -d postgres
docker run --name postgresOnDocker -e POSTGRES_PASSWORD=1qa2ws -d postgres
docker run --name pgdocker -e POSTGRES_PASSWORD=1qa2ws -p 5432:5432 -d postgres
docker run -it --rm --network pgnetwork postgres psql -h some-postgres -U postgres
docker run -it --rm --network pgnetwork postgres psql -h postgres -U postgres
docker run ip a


docker volume ls
docker volume inspect
docker volume inspect pgvolume
docker volume inspect pga4volume

docker network ls
docker network inspect
docker network inspect pgnetwork

docker rm -f  postgredOnDocker
docker --help
docker ps -a

docker-compose up



docker login --username=wasix --password=1qay2wsx
docker images
docker tag 2da71381dfd0 wasix/webassembly-in-docker:latest
docker push wasix/webassembly-in-docker
docker save webassembly-in-docker > webassembly-in-docker.tar
docker load --input webassembly-in-docker.tar 
docker-compose up

