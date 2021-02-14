# We Use an official Python runtime as a parent image
FROM python:3.7-slim-stretch
# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1
# create root directory for our project in the container
RUN mkdir /sample_django_docker
# Set the working directory to /music_service
WORKDIR /sample_django_docker
# Copy the current directory contents into the container at /sample_django_docker
ADD . /sample_django_docker/
# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt
EXPOSE 8000
CMD exec gunicorn sample_django_docker.wsgi:application — bind 0.0.0.0:8000 — workers 3
