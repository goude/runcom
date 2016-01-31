from __future__ import print_function
#import os
#import subprocess
import os

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
    return "d@z"

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
