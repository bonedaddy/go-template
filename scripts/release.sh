#! /bin/bash

if [ ! -d release ]; then
    mkdir release
else
    rm -rf release/*
fi

VERSION=`git describe --tags`

docker build --build-arg VERSION=$VERSION -t bonedaddy/go-template:$VERSION .
docker image tag bonedaddy/go-template:$VERSION bonedaddy/go-template:latest
docker image save bonedaddy/go-template:$VERSION --output release/go-template-docker_$VERSION.tar

# get the cross compiler
GO111MODULE=on go get github.com/mitchellh/gox@master

# add your version strings here
TARGETS="linux/amd64"

mkdir -p release

gox -output="release/go-template-$(git describe --tags)-{{.OS}}-{{.Arch}}" \
    -ldflags "-X main.Version=$VERSION" \
    -osarch="$TARGETS"

ls ./release/* > files
for i in $(cat files); do
    sha256sum "$i" > "$i.sha256"
done