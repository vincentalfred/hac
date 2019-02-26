import paho.mqtt.client as mqtt
from django.utils import timezone
# from .models import Tap
# from apps.machines.models import Machine

def on_connect(client, userdata, flags, rc):
	print("connect to machine1")
	client.subscribe("machine1")

def on_message(client, userdata, msg):
	msg.payload = msg.payload.decode("utf-8")
	from apps.taps.models import Tap
	from apps.machines.models import Machine
	print("test")
	if msg.topic == "machine1":
		print("sudah terima:")
		print(str(msg.payload))
		card_uid = msg.payload
		machine = Machine.objects.get(pk=1)
		tap_time = timezone.now()
		power_usage = 100
		tap = Tap(card_uid = card_uid, machine = machine, tap_time = tap_time, power_usage = power_usage)
		tap.save()

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

# if os.getenv('GAE_APPLICATION', None):
# 	mqtt_server = os.environ['MQTT_SERVER'];
# 	mqtt_user = os.environ['MQTT_USER'];
# 	mqtt_password = os.environ['MQTT_PASSWORD'];
# 	mqtt_port = os.environ['MQTT_PORT'];
# 	client.username_pw_set(mqtt_user, mqtt_password)
# else:
mqtt_server = "192.168.3.157";
# mqtt_server = "localhost";
mqtt_port = 1883;

client.connect(mqtt_server)
print("asdfasdf")