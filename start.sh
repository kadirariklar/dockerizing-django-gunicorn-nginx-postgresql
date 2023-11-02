#!/bin/sh

docker-compose up -d

sleep 5

docker exec -it pyeditorial python3 manage.py collectstatic --noinput
docker exec -it pyeditorial python3 manage.py makemigrations content
docker exec -it pyeditorial python3 manage.py migrate

sleep 5

docker exec -d pyeditorial gunicorn -c /app/PyEditorial/gunicorn_config.py PyEditorial.wsgi:application

echo "********************************************************"

echo "You can reach the application on browser 'testcaseproject.com' with SSL"  
