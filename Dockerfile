FROM python:3.8.5
LABEL maintainer="Victor Hugo N OLiveira"

RUN pip install poetry

COPY poetry.lock pyproject.toml ./

RUN poetry export -f requirements.txt --output requirements.txt

RUN pip install -r requirements.txt

RUN mkdir /var/www
WORKDIR /var/www
COPY  . /var/www
ENV PORT=8000
EXPOSE $PORT 

#ENTRYPOINT python manage.py migrate && python manage.py runserver 0.0.0.0:PORT