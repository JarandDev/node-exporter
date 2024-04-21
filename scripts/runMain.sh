#!/bin/bash

APP=node-exporter
IMAGE=ghcr.io/jaranddev/node-exporter:main

docker rm -f -v $APP

docker run -dt --name $APP --pull=always --restart unless-stopped \
  --net="host" \
  --pid="host" \
  -v "/:/host:ro,rslave" \
  $IMAGE \
  --path.rootfs=/host
