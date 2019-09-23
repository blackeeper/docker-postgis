su postgres
psql -c "CREATE DATABASE yourdatabase;"
psql -d yourdatabase -c "CREATE EXTENSION postgis;"
psql -d yourdatabase -c "CREATE EXTENSION postgis_topology;"

psql -d yourdatabase -c "CREATE EXTENSION postgis_sfcgal;"

psql -d yourdatabase -c "CREATE EXTENSION fuzzystrmatch"
psql -d yourdatabase -c "CREATE EXTENSION postgis_tiger_geocoder;"

psql -d yourdatabase -c "CREATE EXTENSION address_standardizer;"
