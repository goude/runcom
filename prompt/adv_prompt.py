#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from __future__ import print_function
from prompt_color import color

if __name__ == '__main__':
    try:
        import adv_prompter
        adv_prompter.main()
    except:
        print(color('PROMPT/EXC', foreground='red'))
