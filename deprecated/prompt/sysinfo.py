#!/usr/bin/env python
from __future__ import print_function
import subprocess
import re

def cmd_it(cmd):
    cmd_output = subprocess.Popen(cmd, stdout=subprocess.PIPE).communicate()[0]
    lines = cmd_output.split('\n')
    for line in lines:
        if re.match('^/dev/disk', line):
            yield line

def free_disk():
    v = []
    for l in cmd_it(['df', '-h']):
        items = re.split('\s+', l)
        p = re.sub('[^0-9]', '', items[4])
        v.append(int(p))
    return v

def non_idle_cpu():
    cmd_output = subprocess.Popen(['top', '-l 1'], stdout=subprocess.PIPE).communicate()[0]
    lines = cmd_output.split('\n')
    pat = re.compile('CPU usage: (\d+\.\d+)% user, (\d+\.\d+)% sys, (\d+\.\d+)% idle')
    for line in lines:
        match = pat.search(line)
        if match:
            (user_cpu, sys_cpu, idle_cpu) = match.groups()
            return 100.0 - float(idle_cpu)
    return None

if __name__ == "__main__":
    print(free_disk())
