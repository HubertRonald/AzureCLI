#!/bin/bash

# autor: @hubertronald

# Available environment variables
# file .env has default environment variables
source $(pwd)/.env

# Create and up detach Service Container
./stop.sh
docker-compose build
docker-compose up -d
docker-compose exec azcli bash