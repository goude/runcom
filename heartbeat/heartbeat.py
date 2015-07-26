from __future__ import print_function

from goulog import log_event
import socket
import json
import subprocess

def get_ip():
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(("gmail.com",80))
    return s.getsockname()[0]

def get_uptime():
    uptime = subprocess.Popen('uptime', stdout=subprocess.PIPE)
    output = uptime.stdout.read()
    return unicode(output.rstrip(), 'utf-8')

def main():
    hbi = {
        'hostname': socket.gethostname(),
        'ip': get_ip(),
        'uptime': get_uptime(),
    }

    hbs = json.dumps(hbi)
    #print(hbs)
    log_event(name=u'heartbeat.info', value=hbs, unit='json', ip=hbi['ip'])
    log_event(name=u'heartbeat', value=hbi['hostname'], unit=u'', ip=hbi['ip'])

if __name__ == '__main__':
    main()
