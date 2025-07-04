#!/bin/bash

# simple sanity checking for executable
if [ ! -x "$(which protoc)" ]; then
  brew install swift-protobuf
fi

git submodule update --init --recursive

git submodule foreach --recursive git pull origin master

protoc --proto_path=./protobufs --swift_opt=Visibility=Public --swift_out=./MeshtasticProtobufs/Sources ./protobufs/meshtastic/*.proto 

echo "Done generating the swift files from the proto files."
echo "Build, test, and commit changes."
