# Shopify-Summer-2019-Internship-Challenge

Barbones of an online marketplace using ruby on rails api.

## Prerequisites

This application uses docker and thus is needed to start the app

## Starting up

`docker-compose up` to build and/or start the app. Sometimes, docker still believes the app is still running even after shutting it down.
`rm -f tmp/pids/server.pid > /dev/null 2>&1` to delete it and `docker-compose up` to restart it

## Running a rails command

To run a rails command, you must add `docker-compose run web` before entering the command
Example:

```
docker-compose run web rails routes
```

##Tests

The app uses rspec for testing. `docker-compose run web rails test` to run all tests

## Author

- **Bach Nguyen-Ngoc** - [bnguyenngoc](https://github.com/bnguyenngoc)
