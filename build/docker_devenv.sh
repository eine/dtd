#!/bin/sh

set -e # Exit with nonzero exit code if anything fails

cd $(dirname $0)

HOST_DIR=$(realpath $(pwd)/..)
REPO_BIND="/src"
WORK_DIR="/go/src/github.com/1138-4EB"
PORT="5555:8080"

echo "[DTD devenv] Launch golang:alpine docker container"

echo "Host dir      | $HOST_DIR"
echo "Work (go) dir | $WORK_DIR"
echo "Port map/bind | $PORT"

dos2unix init_devenv.sh
dos2unix release.sh

$(command -v winpty) docker \
  run --rm -it \
  -v /"${HOST_DIR}":/"$REPO_BIND" \
  -e REPO_BIND=/"$REPO_BIND" \
  -p "$PORT" \
  -w /"$WORK_DIR" \
  yadtdt/dev sh -c "$(cat init_devenv.sh); sh"
