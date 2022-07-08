import os
import shutil
import sys

from rules_python.python.runfiles import runfiles


def pulumi_path():
  r = runfiles.Create()
  return os.path.realpath(os.path.dirname(r.Rlocation(os.path.join("pulumi/pulumi/pulumi"))))


def main():
  rel_python_path = os.path.join(os.path.dirname(__file__), './python')
  os.environ['PULUMI_PYTHON_CMD'] = os.path.realpath(rel_python_path)

  # Change into the acutal source directory (*not* the runfiles directory)
  p = os.path.realpath(os.path.join(os.path.dirname(__file__), 'Pulumi.yaml'))
  os.chdir(os.path.dirname(p))

  old_pulumi = shutil.which('pulumi')
  os.environ['PATH'] = f'{pulumi_path()}:{os.environ["PATH"]}'
  new_pulumi = shutil.which('pulumi')
  print(f'{old_pulumi} -> {new_pulumi}')
  print(os.environ['PATH'])
  args = ['pulumi'] + sys.argv[1:]
  os.execvp(args[0], args)


if __name__ == '__main__':
  main()
