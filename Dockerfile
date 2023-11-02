FROM python:3.9

WORKDIR /app
COPY . .


RUN pip3 install -r requirements.txt

CMD python3 manage.py collectstatic --noinput && \
    python3 manage.py makemigrations content && \
    python3 manage.py migrate && \
    gunicorn -c PyEditorial/gunicorn_config.py PyEditorial.wsgi:application > gunicorn.log 2>&1 &