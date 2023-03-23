FROM python:3.11-alpine

COPY requirements.txt /tmp/

RUN pip install --upgrade pip && pip install --no-cache-dir -r /tmp/requirements.txt

WORKDIR /code

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV DJANGO_SETTINGS_MODULE=config.settings.production

COPY . .

COPY .env /code/

RUN python manage.py collectstatic --noinput
RUN ["chmod", "+x", "/code/docker-entrypoint.sh"]
ENTRYPOINT ["sh", "/code/docker-entrypoint.sh"]