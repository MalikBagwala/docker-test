# Base Image (Python 3.8)
FROM python:3.8-alpine
LABEL maintainer="Malik Bagwala"

# Python Setup Commands
ENV PYTHONUNBUFFERED 1

# Install all the requirements of the project
COPY ./requirements.txt /requirements.txt
RUN pip install -r /requirements.txt

# Create a folder called app in the docker image to house all the source code
RUN mkdir /app
WORKDIR /app
COPY ./app /app

# Create a user called docker-user to prevent the image being accessed as root
RUN adduser -D docker-user
USER docker-user
