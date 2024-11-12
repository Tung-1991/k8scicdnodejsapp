#!/bin/bash
[ ! -f VERSION ] && echo "1" > VERSION
VERSION=$(cat VERSION)
docker build -t my-nodejs-app:v$VERSION .
TAR_FILE="my-nodejs-app-v$VERSION.tar"
docker save my-nodejs-app:v$VERSION -o $TAR_FILE
sudo ctr -n k8s.io images import $TAR_FILE
rm -f $TAR_FILE
echo $((VERSION + 1)) > VERSION
