#!/bin/bash
set -e
echo "Setting Variables"
IMAGE="UBI-IB"
DATE=`date '+%Y%m%d-%H%M'`
podman login registry1.dso.mil -u $REGISTRY_USER -p $REGISTRY_TOKEN
echo "Running skopeo container"
skopeo sync \
  --src-creds=$REGISTRY_USER:$REGISTRY_TOKEN \
  --src yaml --dest dir $IMAGE.yml $IMAGE
echo "TARchiving Collected Image"
tar -cvzf $IMAGE-$DATE.tgz $IMAGE
echo "Complete"