#!/usr/bin/env bash
set -e

cd $(dirname "$0")

export PULUMI_CONFIG_PASSPHRASE=""
bazel build //test/project:pulumi
PULUMI="../bazel-bin/test/project/pulumi"
"$PULUMI" login "file://$(pwd)/project"
"$PULUMI" stack init -s test || true
"$PULUMI" up -s test -y
