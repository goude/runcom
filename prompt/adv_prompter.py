#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from __future__ import print_function
import datetime
import sysinfo
import math
#from prompt_color import color

SLOWNESS_LIMIT = 1000.0

def make_interpolator(left_min, left_max, right_min, right_max):
    # Figure out how 'wide' each range is
    leftSpan = left_max - left_min
    rightSpan = right_max - right_min

    # Compute the scale factor between left and right values
    scaleFactor = float(rightSpan) / float(leftSpan)

    # create interpolation function using pre-calculated scaleFactor
    def interp_fn(value):
        return right_min + (value-left_min)*scaleFactor

    return interp_fn

def color(string, foreground):
    return("#[fg=%s]%s" % (foreground, string))

def cpu():
    nic = sysinfo.non_idle_cpu()
    return "C%.0f%%" % nic

def thingy(i):
    mapper = make_interpolator(0.0, 1.0, 0, 8)
    height = math.sin(float(i/3.0))
    heightval = int(mapper(height))
    BLOCKS = list(" ▁▂▃▄▅▆▇█")
    b = BLOCKS[heightval]
    return b

def main():
    t0 = datetime.datetime.now()

    parts = []

    for i in range(17):
        parts.append(
            color(thingy(i), 'colour%0d' % i)
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
