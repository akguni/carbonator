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

RUN pip install -r requirements.txt
