# python base image-os
FROM python:3.8-slim-buster
# virtual environment 
ENV PYTHONUNBUFFERED=1
# define work dir 
WORKDIR /django
# copy and install dependency
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt