import paho.mqtt.client as mqtt

def on_connect(client, userdata, rc):
	client.subscribe("$SYS/#")

def on_message(client, userdata, msg):
	pass

mqtt_server = "m24.cloudmqtt.com";
mqtt_user = "wrsyatcc";
mqtt_password = "0myrnXicel2L";
mqtt_port = 17347;

client = mqtt.Client()
client.on_connect = on_connect
client.on_message = on_message

client.username_pw_set(mqtt_user, mqtt_password)
# client.connect("192.168.3.157", 1883, 60)
client.connect(mqtt_server, mqtt_port, 60)