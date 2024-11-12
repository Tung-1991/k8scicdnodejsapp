#!/bin/bash
APP_NAME="my-nodejs-app"
KEEP_IMAGES=2
docker images --filter=reference="$APP_NAME:*" --format '{{.ID}} {{.Repository}}:{{.Tag}} {{.CreatedAt}}' |
  sort -r -k3 |
  tail -n +$((KEEP_IMAGES + 1)) |
  awk '{print $1}' 
  xargs -r docker rmi -f
sudo crictl images | grep "$APP_NAME" |
  sort -r -k4 |
  tail -n +$((KEEP_IMAGES + 1)) |
  awk '{print $3}' 
  xargs -r sudo crictl rmi
