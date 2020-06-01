# ![Django DRF Example App](project-logo.png)

> ### Example Django DRF codebase containing real world examples (CRUD, auth, advanced patterns, etc) that adheres to the [RealWorld](https://github.com/gothinkster/realworld-example-apps) API spec.

<a href="https://thinkster.io/tutorials/django-json-api" target="_blank"><img width="454" src="https://raw.githubusercontent.com/gothinkster/realworld/master/media/learn-btn-hr.png" /></a>

This repo is functionality complete — PR's and issues welcome!

## Installation

1. Clone this repository: `git clone git@github.com:gothinkster/productionready-django-api.git`.
2. `cd` into `conduit-django`: `cd productionready-django-api`.
3. Install [pyenv](https://github.com/yyuu/pyenv#installation).
4. Install [pyenv-virtualenv](https://github.com/yyuu/pyenv-virtualenv#installation).
5. Install Python 3.5.2: `pyenv install 3.5.2`.
6. Create a new virtualenv called `productionready`: `pyenv virtualenv 3.5.2 productionready`.
7. Set the local virtualenv to `productionready`: `pyenv local productionready`.
8. Reload the `pyenv` environment: `pyenv rehash`.

If all went well then your command line prompt should now start with `(productionready)`.

If your command line prompt does not start with `(productionready)` at this point, try running `pyenv activate productionready` or `cd ../productionready-django-api`. 

If pyenv is still not working, visit us in the Thinkster Slack channel so we can help you out.

#### Setting up the Database
```bash
python manage.py makemigrations
python manage.py migrate
```
#### Running the DJango App
```
python manage.py runserver 0.0.0.0:8000
```
#### Adding an admin user
However, there aren’t any users for our Django DRF application.
In order to create admin user, we need to access our container to run the createuser command then enter the promoted credentials:
```bash
python manage.py createsuperuser
```
### Option 2: Use Docker
If you don't have yet a running docker installation, install first docker with
```bash
sudo apt-get install docker.io
```
Fetch the repository from docker
```bash
docker pull realworldio/django-drf
```
#### Running the DJango App
Create a folder to mount the source code of the app
```bash
mkdir ~/django_drf_project
```

Run the DJango DRF app via Docker container

Before running it, make sure you're running the postgres container

```bash
docker run -d -it --rm -p 5432:5432 --name pg1 -e POSTGRES_PASSWORD=password -e POSTGRES_USER=root -e POSTGRES_DB=db-name postgres:11.1
```


```bash
docker run -d -e DB_NAME='db-name' -e DB_USER='root' -e DB_PASS='password'  -p 8000:8000 --name django_drf django_drf
```

#### Adding an admin user
However, there aren’t any users for our Django DRF application.
In order to create admin user, we need to access our container to run the createuser command:

```bash
docker exec -it django_drf bash
```

To add an admin user, you need to run the following code in your container then enter the promoted credentials:
```bash
python manage.py createsuperuser
```
Afterwards, exit the Docker container running the `exit` command.