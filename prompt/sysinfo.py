#!/usr/bin/env python
from __future__ import print_function
import subprocess
import re

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
