#!/bin/bash

python manage.py migrate
echo "Django dockerized now is up."
gunicorn --bind :8000 config.wsgi:application
