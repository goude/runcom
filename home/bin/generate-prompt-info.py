from __future__ import print_function
import os
import subprocess

def main():
    output = []

    if 'BOXNAME' in os.environ:
        output.append('@' + os.environ['BOXNAME'])

    git_user = subprocess.check_output(["git", "config", "--get", "user.email"])

    output.append(git_user)

    output_string = " ".join(output)
    print(output_string)

if __name__ == '__main__':
    main()
