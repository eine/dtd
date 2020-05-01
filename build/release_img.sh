#!/bin/sh

mkdir release
cd release
cp ../dtd-app.tgz ./
cp ../build/dockerfiles/prod ./Dockerfile
echo "ADD dtd-app.tgz /dtd" >> Dockerfile
docker build -t yadtdt/app .
cd ..
rm -rf release
