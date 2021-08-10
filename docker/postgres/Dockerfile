FROM postgres:latest

COPY carbonator.sql /docker-entrypoint-initdb.d/
RUN chown postgres:postgres /docker-entrypoint-initdb.d/*.sql

# EXPOSE 5432