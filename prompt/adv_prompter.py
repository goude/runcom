#!/usr/bin/env python
# -*- coding: utf-8 -*-

from __future__ import print_function
import datetime
import sysinfo
from prompt_color import color

SLOWNESS_LIMIT = 1000.0

def cpu():
    nic = sysinfo.non_idle_cpu()
    return "C%.0f%%" % nic

def mem():
    nic = sysinfo.non_idle_cpu()
    return "M%.0f%%" % nic

def disk():
    nic = sysinfo.non_idle_cpu()
    return "D%.0f%%" % nic

def main():

    t0 = datetime.datetime.now()

    parts = [
        # cpu(),
        # disk(),
        datetime.datetime.now().isoformat(),
        'HMM'
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
