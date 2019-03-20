import os
import jwt
import datetime
import ssl
import paho.mqtt.client as mqtt
from django.utils import timezone

# # rsa_cert_path = 'credentials/rsa_cert.pem'

# topic_id = 'machine1'
# project_id = 'hac-webapp'
# cloud_region = 'asia-east1'
# registry_id = 'hac'
# device_id = 'webapp'
# private_key_file = 'credentials/rsa_private.pem'
# ca_certs = 'credentials/roots.pem'
# algorithm = 'RS256'
# mqtt_bridge_hostname = 'mqtt.googleapis.com'
# mqtt_bridge_port = 8883
# # service_account_json = os.environ['GOOGLE_APPLICATION_CREDENTIALS']
# pubsub_topic = 'projects/{}/topics/{}'.format(project_id, topic_id)


# # The initial backoff time after a disconnection occurs, in seconds.
# minimum_backoff_time = 1

# # The maximum backoff time before giving up, in seconds.
# MAXIMUM_BACKOFF_TIME = 32

# # Whether to wait with exponential backoff before publishing.
# should_backoff = False

# # [START iot_mqtt_jwt]
# def create_jwt(project_id, private_key_file, algorithm):
#     """Creates a JWT (https://jwt.io) to establish an MQTT connection.
#         Args:
#          project_id: The cloud project ID this device belongs to
#          private_key_file: A path to a file containing either an RSA256 or
#                  ES256 private key.
#          algorithm: The encryption algorithm to use. Either 'RS256' or 'ES256'
#         Returns:
#             An MQTT generated from the given project_id and private key, which
#             expires in 20 minutes. After 20 minutes, your client will be
#             disconnected, and a new JWT will have to be generated.
#         Raises:
#             ValueError: If the private_key_file does not contain a known key.
#         """

#     token = {
#             # The time that the token was issued at
#             'iat': datetime.datetime.utcnow(),
#             # The time the token expires.
#             'exp': datetime.datetime.utcnow() + datetime.timedelta(minutes=60),
#             # The audience field should always be set to the GCP project id.
#             'aud': project_id
#     }

#     # Read the private key file.
#     with open(private_key_file, 'r') as f:
#         private_key = f.read()

#     print('Creating JWT using {} from private key file {}'.format(
#             algorithm, private_key_file))

#     return jwt.encode(token, private_key, algorithm=algorithm)
# # [END iot_mqtt_jwt]

# # [START iot_mqtt_config]
# def error_str(rc):
#     """Convert a Paho error to a human readable string."""
#     return '{}: {}'.format(rc, mqtt.error_string(rc))


# def on_connect(unused_client, unused_userdata, unused_flags, rc):
#     """Callback for when a device connects."""
#     print('on_connect', mqtt.connack_string(rc))

#     # After a successful connect, reset backoff time and stop backing off.
#     global should_backoff
#     global minimum_backoff_time
#     should_backoff = False
#     minimum_backoff_time = 1


# def on_disconnect(unused_client, unused_userdata, rc):
#     """Paho callback for when a device disconnects."""
#     print('on_disconnect', error_str(rc))

#     # Since a disconnect occurred, the next loop iteration will wait with
#     # exponential backoff.
#     global should_backoff
#     should_backoff = True


# def on_publish(unused_client, unused_userdata, unused_mid):
#     """Paho callback when a message is sent to the broker."""
#     print('on_publish')


# def on_message(unused_client, unused_userdata, message):
#     """Callback when the device receives a message on a subscription."""
#     payload = str(message.payload)
#     print('Received message \'{}\' on topic \'{}\' with Qos {}'.format(
#             payload, message.topic, str(message.qos)))


# def get_client(
#         project_id, cloud_region, registry_id, device_id, private_key_file,
#         algorithm, ca_certs, mqtt_bridge_hostname, mqtt_bridge_port):
#     """Create our MQTT client. The client_id is a unique string that identifies
#     this device. For Google Cloud IoT Core, it must be in the format below."""
#     client = mqtt.Client(
#             client_id=('projects/{}/locations/{}/registries/{}/devices/{}'
#                        .format(
#                                project_id,
#                                cloud_region,
#                                registry_id,
#                                device_id)))

#     # With Google Cloud IoT Core, the username field is ignored, and the
#     # password field is used to transmit a JWT to authorize the device.
#     client.username_pw_set(
#             username='unused',
#             password=create_jwt(
#                     project_id, private_key_file, algorithm))

#     # Enable SSL/TLS support.
#     client.tls_set(ca_certs=ca_certs, tls_version=ssl.PROTOCOL_TLSv1_2)

#     # Register message callbacks. https://eclipse.org/paho/clients/python/docs/
#     # describes additional callbacks that Paho supports. In this example, the
#     # callbacks just print to standard out.
#     client.on_connect = on_connect
#     client.on_publish = on_publish
#     client.on_disconnect = on_disconnect
#     client.on_message = on_message

#     # Connect to the Google MQTT bridge.
#     client.connect(mqtt_bridge_hostname, mqtt_bridge_port)

#     # This is the topic that the device will receive configuration updates on.
#     mqtt_config_topic = '/devices/{}/config'.format(device_id)

#     # Subscribe to the config topic.
#     client.subscribe(mqtt_config_topic, qos=1)

#     # The topic that the device will receive commands on.
#     mqtt_command_topic = '/devices/{}/commands/#'.format(device_id)

#     # Subscribe to the commands topic, QoS 1 enables message acknowledgement.
#     print('Subscribing to {}'.format(mqtt_command_topic))
#     client.subscribe(mqtt_command_topic, qos=0)

#     # print('Subscribing to {}'.format(pubsub_topic))
#     # client.subscribe(pubsub_topic, qos=1)

#     return client
# # [END iot_mqtt_config]

# client = get_client(project_id, cloud_region, registry_id, device_id, private_key_file,
#         algorithm, ca_certs, mqtt_bridge_hostname, mqtt_bridge_port)

# mqtt_topic = '/devices/{}/state'.format(device_id)
# payload = "testpublish12"
# # client.publish(mqtt_topic, payload, qos=1)

# def on_connect(client, userdata, flags, rc):
# 	print("connect to machine1")
# 	client.subscribe("machine1")

# def on_message(client, userdata, msg):
# 	msg.payload = msg.payload.decode("utf-8")
# 	from apps.taps.models import Tap
# 	from apps.machines.models import Machine
# 	if msg.topic == "machine1":
# 		print(msg.topic+" "+str(msg.payload))
# 		card_uid = msg.payload
# 		machine = Machine.objects.get(pk=1)
# 		tap_time = timezone.now()
# 		power_usage = 100
# 		tap = Tap(card_uid = card_uid, machine = machine, tap_time = tap_time, power_usage = power_usage)
# 		tap.save()

# client = mqtt.Client()
# client.on_connect = on_connect
# client.on_message = on_message

# if os.getenv('GAE_APPLICATION', None):
# 	mqtt_server = os.environ['MQTT_SERVER'];
# 	mqtt_user = os.environ['MQTT_USER'];
# 	mqtt_password = os.environ['MQTT_PASSWORD'];
# 	mqtt_port = os.environ['MQTT_PORT'];
# 	client.username_pw_set(mqtt_user, mqtt_password)
# else:
# 	mqtt_server = "192.168.3.157";
# 	mqtt_port = 1883;

# client.connect(mqtt_server)