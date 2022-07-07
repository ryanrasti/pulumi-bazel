set -e

PULUMI_PYTHON_CMD=$(realpath "$PULUMI_PYTHON_CMD")
# TODO: add a better test here (import a dep & test a function)
"$PULUMI_PYTHON_CMD" --version

cd $(dirname "$PULUMI_YAML")

pwd
exec pulumi "$@"
