#!/bin/bash

set -e
set -x


docker-compose exec scylladb-node1 cqlsh -e "DROP KEYSPACE IF EXISTS staccato;"
docker-compose exec scylladb-node1 cqlsh -e "CREATE KEYSPACE staccato WITH REPLICATION = {'class': 'NetworkTopologyStrategy', 'replication_factor': 1};"
docker-compose exec scylladb-node1 cqlsh -e "CREATE TABLE staccato.customers (route_base text, user_hash int, user_id bigint, record text, PRIMARY KEY ((route_base, user_hash), user_id));"
docker-compose exec scylladb-node1 cqlsh -e "CREATE TABLE staccato.customers_with_ttl (route_base text, user_hash int, user_id bigint, record text, PRIMARY KEY ((route_base, user_hash), user_id));"

docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('18.web', 2931, 3165309028638982145, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('18.web', 2931, 3165309032936898573, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('18.web', 2931, 3165309035080384528, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('18.web', 2931, 3165309041523752968, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('18.web', 2931, 3165309050113097754, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('18.web', 2931, 3165309062999506947, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('18.web', 2931, 3165309067294605323, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('18.web', 2931, 3165309069443399696, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('18.web', 2931, 3165309088773242889, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('18.web', 2931, 3165309101658210316, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('1663.web', 3367, 3622489339308736513, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('1663.web', 3367, 3622576267298406401, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('1663.web', 3367, 3662865931721506817, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('1663.web', 3367, 3675747221541093387, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('1663.web', 3367, 3675747230132076552, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('1663.web', 3367, 3675747238720962577, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('1663.web', 3367, 3675747395488317446, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('1663.web', 3367, 3675747457764556810, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('1663.web', 3367, 3675747565138280449, 'some data');"
docker-compose exec scylladb-node1 cqlsh -e "INSERT INTO staccato.customers (route_base, user_hash, user_id, record) VALUES ('1663.web', 3367, 3676036960035078150, 'some data');"

