#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from __future__ import print_function
import datetime
import sysinfo
import random
#from prompt_color import color

SLOWNESS_LIMIT = 1000.0

def color(string, foreground):
    return("#[fg=%s]%s" % (foreground, string))

def cpu():
    nic = sysinfo.non_idle_cpu()
    return "C%.0f%%" % nic

def thingy():
    BLOCKS = list(" ▁▂▃▄▅▆▇█")
    b = random.choice(BLOCKS)
    return b

def main():
    t0 = datetime.datetime.now()

    parts = []
    # map sin() to range
    for i in range(40):
        parts.append(
            color(thingy(), 'colour%0d' % i)
        )

    # slowness warning
    tm = datetime.datetime.now() - t0
    milliseconds = tm.microseconds / 1000.0
    if milliseconds > SLOWNESS_LIMIT:
        #parts.append('%.1f ms' % milliseconds)
        parts.append(color('SLW', foreground='red'))

    # Remove empty strings
    parts = [part for part in parts if part]

    output_string = "".join(parts)
    print(output_string)

if __name__ == '__main__':
    main()
