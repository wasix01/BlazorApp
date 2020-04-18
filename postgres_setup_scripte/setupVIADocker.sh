#!/bin/sh

docker cp ./setupBlazorDB.sql    postgresql:/docker-entrypoint-initdb.d/setupBlazorDB.sql
docker cp ./setupBlazorTable.sql postgresql:/docker-entrypoint-initdb.d/setupBlazorTable.sql
docker exec -u postgres          postgresql psql postgres postgres -f docker-entrypoint-initdb.d/setupBlazorDB.sql
docker exec -u postgres          postgresql psql blazor   postgres -f docker-entrypoint-initdb.d/setupBlazorTable.sql
