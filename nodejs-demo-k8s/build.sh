#!/bin/bash
[ ! -f VERSION ] && echo "1" > VERSION
VERSION=$(cat VERSION)
docker build -t my-nodejs-app:v$VERSION .
docker save my-nodejs-app:v$VERSION -o my-nodejs-app-v$VERSION.tar
sudo ctr -n k8s.io images import my-nodejs-app-v$VERSION.tar
echo $((VERSION + 1)) > VERSION
