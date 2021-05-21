FROM python:3

ENV PYTHONUNBUFFERED=1
WORKDIR /usr/src/app/

RUN apt-get update && \
    apt-get install -y \
    postgresql-client \
    chromium

COPY . .

RUN pip install -r ./docker/website/requirements.txt

EXPOSE 8000