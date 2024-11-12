#!/bin/bash
APP_NAME="my-nodejs-app"
KEEP_IMAGES=2
docker images --filter=reference="$APP_NAME:*" --format '{{.CreatedAt}} {{.ID}}' | \
  sort -k2 | 
  head -n -$KEEP_IMAGES | 
  awk '{print $5}' | 
  xargs -r docker rmi -f

sudo crictl images | grep "$APP_NAME" |
  sort -k2 |
  head -n -$KEEP_IMAGES | 
  awk '{print $3}' |
  xargs -r sudo crictl rmi
