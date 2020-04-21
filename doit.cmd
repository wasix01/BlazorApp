
docker-compose up --detach postgres
docker cp ./postgres_setup_scripte/setupBlazorDB.sql    DockerPostgresql:/docker-entrypoint-initdb.d/setupBlazorDB.sql
docker cp ./postgres_setup_scripte/setupBlazorTable.sql DockerPostgresql:/docker-entrypoint-initdb.d/setupBlazorTable.sql
docker exec -u postgres                                 DockerPostgresql psql postgres postgres -f docker-entrypoint-initdb.d/setupBlazorDB.sql
docker exec -u postgres                                 DockerPostgresql psql blazor   postgres -f docker-entrypoint-initdb.d/setupBlazorTable.sql
docker-compose up --detach pgadmin4
docker-compose up --detach blazor_app
