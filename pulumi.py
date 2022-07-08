import os
import sys

from rules_python.python.runfiles import runfiles

# BASE_DIR (in brackets) is substituted as a genrule:
BASE_DIR = os.path.relpath('{{BASE_DIR}}', 'bazel-out/host/bin')

def path(p):
  r = runfiles.Create()
  return os.path.realpath(r.Rlocation(os.path.join('pulumi_bazel', BASE_DIR, p)))

def main():
  os.environ['PULUMI_PYTHON_CMD'] = path('python')
  os.chdir(os.path.dirname(path('Pulumi.yaml')))
  args = ['pulumi'] + sys.argv[1:]
  os.execvp(args[0], args)

if __name__ == '__main__':
  main()
