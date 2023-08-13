#!/bin/bash

# autor: @hubertronald

# Destroy Service Container and Image not data folder
./stop.sh
docker-compose rm azcli
docker image rm azurecli_azcli