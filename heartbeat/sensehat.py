from sense_hat import SenseHat

def get_info():
    s = SenseHat()

    info = {
        'temperature': s.get_temperature(),
        'pressure': s.get_pressure(),
        'humidity': s.get_humidity(),
        'orientation': s.get_orientation(),
        'compass': s.get_compass(),
        'gyroscope': s.get_gyroscope(),
        'accelerometer': s.get_accelerometer(),
        'pixels': s.get_pixels(),
    }

    return { 'sensehat': info }
