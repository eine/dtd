#!/bin/sh

if [ -d "release" ]; then
  rm -rf release
fi
mkdir release

cd app
if [ -d "dist" ]; then
  rm -rf dist
fi
yarn build -v
mv dist ../release/public

cd ../api
CGO_ENABLED=0 go build -a -o ../release/dtd

cd ..

tar -zcvf dtd-app.tgz -C release .

rm -rf release
