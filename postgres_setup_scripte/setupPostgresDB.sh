#!/bin/sh

psql -h localhost -U postgres -p 5432  -f setupBlazorDB.sql 
psql -h localhost -U postgres -p 5432  -d blazor  -f setupBlazorTable.sql 
psql -h localhost -U postgres -p 5432  -l
