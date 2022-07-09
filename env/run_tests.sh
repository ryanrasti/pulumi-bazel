#!/bin/bash
set -ev

cd $(dirname "$0")

REPO=$(git rev-parse --show-toplevel)
TMP=$(mktemp -d)
echo "In $TMP"
cd "$TMP"
git clone "$REPO"
cd $(basename "$REPO")

TAG=tester:local-$(uuidgen)
docker build env/. -t $TAG
docker run -it -v $(pwd):/src -w /src $TAG test/test.sh
