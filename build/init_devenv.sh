#!/bin/sh

if [ "$REPO_BIND" != "" ]; then
  echo "[DTD devenv] symlink $REPO_BIND and work_dir"
  ln -s "$REPO_BIND" dtd
fi

echo "[DTD devenv] go get dtd/api dependencies"

cd dtd/api
dep ensure

echo "[DTD devenv] yarn install dtd/app dependencies"

cd ../app
yarn install

echo "[DTD devenv] go get dtd/cli dependencies"

cd ../cli
dep ensure

echo "[DTD devenv] go get dtd/dtdlib dependencies"

cd ../dtdlib
dep ensure

cd ..

echo "[DTD devenv] Happy hacking!"
