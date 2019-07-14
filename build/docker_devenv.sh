#!/bin/sh

set -e # Exit with nonzero exit code if anything fails

cd $(dirname $0)

HOST_DIR=$(realpath $(pwd)/..)
PORT="5500:8080"

echo "[DTD devenv] Launch golang:alpine docker container"

echo "Host dir      | $HOST_DIR"
echo "Port map/bind | $PORT"

if [ "$(command -v dos2unix)" != "" ]; then
  dos2unix release.sh
fi

$(command -v winpty) docker \
  run --rm -it \
  -p "$PORT" \
  -v /"${HOST_DIR}"://src \
  -w //src \
  yadtdt/dev sh -c "go get ./... ; cd app; yarn install; cd ..; sh"
