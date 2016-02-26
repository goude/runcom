# source: https://gist.github.com/seanh/5233082
import os

def _zsh_zero_width(s):
    '''Return the given string, wrapped in zsh zero-width codes.
    This tells zsh that the string is a zero-width string, eg. for prompt
    alignment and cursor positioning purposes. For example, ANSI escape
    sequences should be marked as zero-width.
    '''
    return "%{{{s}%}}".format(s=s)

if 'SHELL' in os.environ and 'zsh' in os.environ['SHELL']:
    _zero_width = _zsh_zero_width
else:
    _zero_width = lambda x: x


def _foreground(s, color):
    colors = {
        'black': '\x1b[30m',
        'red': '\x1b[31m',
        'green': '\x1b[32m',
        'yellow': '\x1b[33m',
        'blue': '\x1b[34m',
        'magenta': '\x1b[35m',
        'cyan': '\x1b[36m',
        'white': '\x1b[37m',
    }
    return "{color}{s}".format(color=_zero_width(colors[color]), s=s)


def _background(s, color):
    colors = {
        'black': '\x1b[40m',
        'red': '\x1b[41m',
        'green': '\x1b[42m',
        'yellow': '\x1b[43m',
        'blue': '\x1b[44m',
        'magenta': '\x1b[45m',
        'cyan': '\x1b[46m',
        'white': '\x1b[47m',
    }
    return "{color}{s}".format(color=_zero_width(colors[color]), s=s)


def _bold(s):
    return "{bold}{s}".format(bold=_zero_width("\x1b[1m"), s=s)


def _underline(s):
    return "{underline}{s}".format(underline=_zero_width("\x1b[4m"), s=s)


def _reverse(s):
    return "{reverse}{s}".format(reverse=_zero_width("\x1b[7m"), s=s)


def _reset(s):
    return "{s}{reset}".format(s=s, reset=_zero_width("\x1b[0m"))


def color(s, foreground=None, background=None, bold=False, underline=False, reverse=False):
    '''Return the given string, wrapped in the given colour.
    Foreground and background can be one of:
    black, red, green, yellow, blue, magenta, cyan, white.
    Also resets the colour and other attributes at the end of the string.
    '''
    if not s:
        return s
    if foreground:
        s = _foreground(s, foreground)
    if background:
        s = _background(s, background)
    if bold:
        s = _bold(s)
    if underline:
        s = _underline(s)
    if reverse:
        s = _reverse(s)
    s = _reset(s)
    return s


def horizontal_rule(char='-'):
    '''Return a long string of the given characters.
    The string will be as long as the width of the user's terminal in
    characters, and will have a newline at the end.
    '''
    width = os.popen('stty size', 'r').read().split()[1]
    width = int(width)
    return char * width + _zero_width('\n')

