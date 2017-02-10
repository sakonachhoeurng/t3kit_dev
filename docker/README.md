# t3kit_docker

## Docker development environment for [t3kit](https://github.com/t3kit/t3kit) project.

[![Release](https://img.shields.io/github/release/visay/t3kit_dev.svg?style=flat-square)](https://github.com/visay/t3kit_dev/releases)

- [CHANGELOG](https://github.com/visay/t3kit_dev/blob/master/CHANGELOG.md)
- [CONTRIBUTING](https://github.com/t3kit/t3kit/blob/master/CONTRIBUTING.md)

#### Required dependencies:

* [Docker](https://www.docker.com)
* [Docker Compose](https://github.com/docker/compose)

***

## Starting up Docker containers:

- After first clone and install dependencies with `./init.sh` or `./initWithComposer.sh`,
start docker containers with:

    - `docker-compose up -d`

- Run the `t3kit` container at least once to execute the entrypoint for restoring the database:

    - `docker-compose run --rm t3kit /bin/bash`

- open in browser: `localhost:8082`

### Development of t3kit core with Docker ###

- Once the site is up, you will want to develop the code on your host machine and have the changes automatically reflect
inside docker container. To do that, just enable the shared volumes in `docker-compose.yml` as below:

```yaml
  t3kit:
#    build: 'docker'
    image: 't3kit/t3kit:latest'
    volumes:
      - ./shared:/var/www/shared
    ports:
      - "8082:80"
    links:
      - db
      - mail
```

- Then restart the containers:

```bash
docker-compose restart
```

### Some important commands

* Start docker containers
`docker-compose up -d`

* Stop docker containers
`docker-compose stop`

* Delete docker containers
`docker-compose rm`

* Check status of docker containers
`docker-compose ps`

* Run shell in application container
`docker-compose run --rm t3kit /bin/bash`

[Docker compose command reference](https://docs.docker.com/compose/reference/)

### Connecting

####TYPO3 Site is available at **http://localhost:8082/**

- TYPO3 Backend Login: admin
- TYPO3 Backend Password: admin1234
- TYPO3 Install Tool Password: admin1234
- Web root from local machine is : `shared/site/`
- Web root from docker container is : `/var/www/shared/site/`

####Mailcatcher is available at **http://localhost:8025/**

####MySQL is available from your host machine at **localhost:3308**

- Username: t3kit
- Password: t3kit1234
- DB name: t3kit

##Docker Image

* We are using a custom docker image based on php:5.6-apache image [t3kit/t3kit](https://hub.docker.com/r/t3kit/t3kit)
* [t3kit Dockerfile](https://github.com/visay/t3kit_dev/blob/docker/docker/Dockerfile)
