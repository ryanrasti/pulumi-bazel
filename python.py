#!/usr/bin/env python3
import os
import sys

def main():
    os.execv(sys.executable, [sys.executable] + sys.argv[1:])


if __name__ == '__main__':
    main()
