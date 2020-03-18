FROM python:3.6-buster
ENV PYTHONUNBUFFERED 1

ADD ./travis_django_test /code/travis_django_test
ADD ./manage.py /code
ADD ./requirements.txt /code

WORKDIR /code

RUN apt-get update && apt-get install && \
    pip install -U pip && \
    pip install -r requirements.txt && \
    python manage.py migrate

EXPOSE 8000