import os
import sys

def path(p):
  # Get the real path for this .py file
  realfile = os.path.realpath(__file__)
  # Then get the directory:
  return os.path.realpath((os.path.join(os.path.dirname(__file__), p)))

def main():
  rel_python_path = os.path.join(os.path.dirname(__file__), './python')
  os.environ['PULUMI_PYTHON_CMD'] = os.path.realpath(rel_python_path)
  
  # Change into the acutal source directory (*not* the runfiles directory)
  p = os.path.realpath(os.path.join(os.path.dirname(__file__), 'Pulumi.yaml'))
  os.chdir(os.path.dirname(p))
  args = ['pulumi'] + sys.argv[1:]
  os.execvp(args[0], args)

if __name__ == '__main__':
  main()
