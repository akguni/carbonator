FROM python:3

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED=1
ENV APP_HOME=/usr/src/app/
ENV APP_USER=appuser
 
RUN groupadd -r $APP_USER && \
    useradd -r -g $APP_USER -d $APP_HOME -s /sbin/nologin -c "Docker image user" $APP_USER
 
WORKDIR $APP_HOME

RUN apt-get update && \
    apt-get install -y \
    postgresql-client \
    chromium \
    libpcre3 \
    libpcre3-dev \
    python-dev

COPY . .

RUN chmod -R +rx /usr/src/app/static

RUN pip install --upgrade pip -r docker/website/requirements.txt

RUN chown -R $APP_USER:$APP_USER $APP_HOME

USER $APP_USER