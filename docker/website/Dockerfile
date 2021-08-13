FROM python:3

ENV PYTHONUNBUFFERED=1
WORKDIR /usr/src/app/

RUN apt-get update && \
    apt-get install -y \
    postgresql-client \
    chromium \
    libpcre3 \
    libpcre3-dev \
    python-dev

COPY . .

RUN chmod -R +rx /usr/src/app/static

#COPY ./docker/website/requirements.txt ./docker/website/requirements.txt

RUN pip install -r docker/website/requirements.txt
