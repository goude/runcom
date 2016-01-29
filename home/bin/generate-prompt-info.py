from __future__ import print_function
import os

def main():
    if 'BOXNAME' in os.environ:
        print('@' + os.environ['BOXNAME'])

if __name__ == '__main__':
    main()
