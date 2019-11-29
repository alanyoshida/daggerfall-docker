# daggerfall-docker
Run daggerfall in docker container using host X server.

## Requirements
* docker
* docker-compose

# Instructions

## Build image Download game
`$ export USERID=$(id -u) && export GROUPID=$(id -g) && docker-compose build`

## Install the game

### Steps:

1 - First time will install the game

`$ docker-compose up`

Inside the install follow the steps:
* CONTINUE, I agree to the terms
* Install the game to your hard drive
* Change the install size
* Huge Installation
* Yes, the instalation size is fine
* Yes, I want to install the game here
* Go ahead and install the game
* No (the sound card support is not ready for this container based game)
* OK

2 - Second time will update, just press y

`$ docker-compose up`

3 - Third time will run the game

`$ docker-compose up`
