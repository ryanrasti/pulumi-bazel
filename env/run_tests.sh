#!/bin/bash
set -e

TAG=tester:local-$(uuidgen)
docker build . -t $TAG
docker run -it -v $(pwd)/..:/src $TAG test/test.sh
