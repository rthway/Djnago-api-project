##  Build and Start Local Django Application in a Container
In this time I use my django-api application you can choose your own django application.
or you can also clone use this project from  [here](https://github.com/rthway/Djnago-api-project "link")
### 1. Open your project directory.
*In my case I have dajgo project as name tutorial DIR so I use, *
`$ cd tutorial`

### Create a requirements.txt in your project directory.
**For Python3
**`$ pip3 freeze > requirements.txt `
**Python2
**`$ pip freeze > requirements.txt `
### 2. Create a new file called Dockerfile in your project directory.
The Dockerfile defines an application’s image content via one or more build commands that configure that image. Once built, you can run the image in a container. 
### 3. Add the following content to the Dockerfile.
    # python base image-os
    FROM python:3.8-slim-buster
    # virtual environment 
    ENV PYTHONUNBUFFERED=1
    # define work dir 
    WORKDIR /django
    # copy and install dependency
    COPY requirements.txt requirements.txt
    RUN pip3 install -r requirements.txt
	

### 4. Create a file called `docker-compose.yml `in your project directory.

Add the following configuration to the file.

```yaml
version: "3.8"
services:
  app:
    build: .
    volumes:
      - .:/django
    ports:
      - 8000:8000
    image: app:django
    container_name: django_container
    command: python manage.py runserver 0.0.0.0:8000
```
### 5. Create a file called `.dockerignore `in your project directory and skip unnessesary files like virtual env.
Add the following configuration to the file.
```yaml
*/env
```


### 6. Run the `docker-compose build` command from the top level directory for your project to build docker image.

` $ docker-compose build`
### 7. Run the `docker-compose up` command from the top level directory for your project.
`$ docker compose up `
At this point, your Django app should be running at port 8000 on your Docker host.  Go to http://0.0.0.0:8000 on a web browser to see the Django Application.






> Note:
On certain platforms you might need to edit `ALLOWED_HOSTS` inside `settings.py` and add your Docker host name or IP address to the list. For demo purposes, you can set the value to:

```yaml
...
ALLOWED_HOSTS = ['*']
...
```




