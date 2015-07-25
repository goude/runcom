import json
import requests

def log_event(name, value, ip=u'', unit=u'', timestamp=u'CURRENT_TIMESTAMP'):
    log_item = {
        'name': name,
        'value': value,
        'unit': unit,
        'timestamp': timestamp,
        'ip': ip,
    }

    requests.post(
        'http://log.goude.se/api/event',
        data = json.dumps(log_item),
        headers = {'content-type': 'application/json'}
    )

if __name__ == '__main__':
    import socket
    log_event(u'client.test', socket.gethostname(), 'hostname')
