set -e

cd $(dirname "$0")

export PULUMI_CONFIG_PASSPHRASE=""
bazel run //test/project:pulumi login "file://$(pwd)/project"
bazel run //test/project:pulumi up -- -s test -y
