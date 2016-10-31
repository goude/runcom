#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
import os
import re
import datetime
import platform

from prompt_color import color

SLOWNESS_LIMIT = 20.0

def system():
    rel = platform.release()
    sy = platform.system().lower()
    return "%s%s" % (sy[:3], rel.split('.')[0])

def version():
    v = platform.python_version_tuple()
    return ("py%s.%s" % (v[0], v[1]))

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

def proxy():
    proxy = os.environ.get('HTTP_PROXY', '')
    if proxy:
        return '℗'
    return None

def gituser():
    home = os.environ.get('HOME', '')
    with open(os.path.join(home, '.gitconfig'), 'rb') as fp:
        gitstring = str(fp.read())
        email = re.search(r'email = (.+)', gitstring)
        if email:
            shortened = re.sub(r'^(.)[^@]+@(.{1,2}).+$', r'\1@\2', email.groups(1)[0])
            return shortened

    return None

def main():

    t0 = datetime.datetime.now()

    parts = [
        #'│',
        system(),
        version(),
        color(virtualenv(), foreground='green'),
        docker(),
        proxy(),
        color(gituser(), foreground='blue')
    ]

    # slowness warning
    tm = datetime.datetime.now() - t0
    milliseconds = tm.microseconds / 1000.0
    if milliseconds > SLOWNESS_LIMIT:
        #parts.append('%.1f ms' % milliseconds)
        parts.append(color('SLW', foreground='red'))

    # Remove empty strings
    parts = [part for part in parts if part]

    output_string = " ".join(parts)
    print(output_string)

if __name__ == '__main__':
    main()
