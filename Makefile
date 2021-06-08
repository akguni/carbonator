build-website:
	docker build --force-rm -t carbonator:latest ./docker/website

build-database:
	docker build --force-rm -t postgres:latest ./docker/postgres

compose-start:
	docker-compose up --remove-orphans $(options)

compose-stop:
	docker-compose down --remove-orphans

backup-database:
	systemctl restart postgresql.service
	pg_dump -U carbonator -W -F p carbonator -h localhost > ./docker/postgres/carbonator.sql

wipe:
	docker stop $(docker ps -qa) && docker system prune -af --volumes