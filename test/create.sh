set -e
cd project
PULUMI_CONFIG_PASSPHRASE="" pulumi new python -n test -d "Test project" -s test --secrets-provider passphrase
rm -r venv/
# TODO manually delete   
# options:
#    virtualenv: venv
# in yaml file