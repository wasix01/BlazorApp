#!/bin/sh


build_blazorapp() {
	(
	  cd ../BlazorCRUDApp
	  docker build -t webassembly-in-docker .
	  docker login --username=wasix --password=1qay2wsx
	  docker tag webassembly-in-docker wasix/webassembly-in-docker:latest
	  docker push wasix/webassembly-in-docker

	  #docker save webassembly-in-docker > webassembly-in-docker.tar
	  #docker load --input webassembly-in-docker.tar
	  #docker run -p 8080:80 webassembly-in-docker
	  #docker run -it 167eaee50a1a bash
	)
}


init_pg() {
	(
		docker cp ./setup_scripte/setupBlazorDB.sql    DockerPostgresql:/docker-entrypoint-initdb.d/setupBlazorDB.sql
		docker cp ./setup_scripte/setupBlazorTable.sql DockerPostgresql:/docker-entrypoint-initdb.d/setupBlazorTable.sql
		docker exec -u postgres                        DockerPostgresql psql postgres postgres -f docker-entrypoint-initdb.d/setupBlazorDB.sql
		docker exec -u postgres                        DockerPostgresql psql blazor   postgres -f docker-entrypoint-initdb.d/setupBlazorTable.sql
	)
}


main() {
	echo ">>> Start creating BlazorCRUDApp"
	build_blazorapp
	echo ">>> Start docker postgres"
	docker-compose up --detach postgres
	echo ">>> initialize postgres"
	init_pg
	echo ">>> Start docker pgadmin4"
	docker-compose up --detach pgadmin4
	echo ">>> Start docker blazor_app"
	docker-compose up --detach blazor_app
}

main
