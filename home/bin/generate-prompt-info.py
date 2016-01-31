from __future__ import print_function
#import os
#import subprocess
import os
import re

def virtualenv():
    path = os.environ.get('VIRTUAL_ENV', '')
    if path:
        path = os.path.basename(path)
    return path

def docker():
    path = os.environ.get('DOCKER_MACHINE_NAME', '')
    if path:
        path = os.path.basename(path)
    return path

def gituser():
    home = os.environ.get('HOME', '')
    with open(os.path.join(home, '.gitconfig'), 'rb') as fp:
        s = fp.read()
        res = re.search(r'email = (.+)', s)
        if res:
            return res.groups(1)[0]

    return None

def main():
    parts = [
        virtualenv(),
        docker(),
        gituser(),
    ]

    # Remove empty strings
    parts = [part for part in parts if part]

    output_string = " ".join(parts)
    print(output_string)

if __name__ == '__main__':
    main()
