from __future__ import print_function
import time
import random
import datetime


DICE = [
    '',
    '',
    '',
    '',
    '',
    '',
]


# https://stackoverflow.com/questions/1969240/mapping-a-range-of-values-to-another
def translate(value, leftMin, leftMax, rightMin, rightMax):
    # Figure out how 'wide' each range is
    leftSpan = leftMax - leftMin
    rightSpan = rightMax - rightMin

    # Convert the left range into a 0-1 range (float)
    valueScaled = float(value - leftMin) / float(leftSpan)

    # Convert the 0-1 range into a value in the right range.
    return rightMin + (valueScaled * rightSpan)


def second_spinner(dt):
    '''
    Given a datetime, return a symbol string representing the number
    of seconds.
    '''
    index = int(translate(dt.second, 0, 60, 0, 5))
    return DICE[index]


def thx_time(dt):
    ''' Given a datetime, return a string representing the current time.'''
    data = {
        '01:17': 'Ezekiel',    # 25 = 01
        '03:14': 'π',
        '06:28': 'τ',
        '11:06': 'Hastings',   # 10:66 = 10:60 + 6 = 11:06
        '11:38': 'THX',
        '13:28': 'Big Ben',     # Umm, music
        '13:37': 'Teel',
        '15:17': '95LUTH',
        '22:27': 'Baker St.',  # 1B = 27
    }

    current_time_24 = dt.strftime('%H:%M')
    current_time_12 = dt.strftime('%I:%M')

    if current_time_24 in data:
        return data[current_time_24]
    elif current_time_12 in data:
        return data[current_time_12]
    else:
        return current_time_24


def D6(n=3):
    return Dx(x=6, n=n)


def Dx(x=6, n=3):
    dice = []
    for i in range(n):
        roll = random.randint(1, 6)
        dice.append(roll)
        # DICE[roll - 1]
    diestr = ' '.join([DICE[d - 1] for d in dice])
    return '%s 烈%d' % (diestr, sum(dice))


def thx_time_extended(dt):
    ''' Given a datetime, return a string representing several time measures.
    '''
    #time_str = '冀{}  {}  ({}){}'.format(
    time_str = 'W{}  {}  ({}){}'.format(
        dt.now().isocalendar()[1],
        # dt.now().strftime('%m-%d'),
        dt.now().strftime('%y-%m-%d'),
        dt.utcnow().strftime('%H'),
        thx_time(dt),
        # D6(3),
        # second_spinner(dt)
    )
    return time_str


def thx_time_now():
    return thx_time(datetime.datetime.now())


def thx_time_extended_now():
    return thx_time_extended(datetime.datetime.now())


if __name__ == '__main__':
    print(thx_time_extended_now())
