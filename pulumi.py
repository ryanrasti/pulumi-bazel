import os
import sys

def path(p):
  return os.path.realpath((os.path.join(os.path.dirname(__file__), p)))

def main():
  print(path('.'))
  os.environ['PULUMI_PYTHON_CMD'] = path('./python')
  os.chdir(path('.'))
  args = ['pulumi'] + sys.argv[1:]
  os.execvp(args[0], args)

if __name__ == '__main__':
  main()
