#!/bin/bash
set -e

TAG=tester:local-$(uuidgen)
docker build . -t $TAG
docker run -v $(pwd)/..:/src $TAG test/test.sh
