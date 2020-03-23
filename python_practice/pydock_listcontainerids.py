#import docker
#client = docker.from_env()
#for container in client.containers.list():
#  print(container.id)


#  File "python_dockerapi.py", line 4
#    print container.id
#                  ^
#SyntaxError: Missing parentheses in call to 'print'. Did you mean print(container.id)?


#import docker
#cli = docker.from_env()
#cli.containers.list()
#print(cli.containers.list)

#import docker
#import requests
#import socket

#server = /var/run/docker.sock(socket.AF_UNIX, socket.SOCK_STREAM)
#server.bind("/tmp/socket_test.s")

#requests.get(/var/run/docker.sock -X GET http:/v1.39/containers/json

from docker import Client
import json
#c = Client(base_url='unix://var/run/docker.sock')
#cli = Client(base_url='tcp://127.0.0.1:2375')
cli = Client(base_url='unix://var/run/docker.sock')
printVar = str(cli.containers())
#printVar = str(printVar)
print(printVar)
print(type(printVar))
#returnVar = str(printVar)
#print(type(returnVar))
jsonParse = json.dumps(printVar)
print(jsonParse)
with open('test.json', 'w') as json_file:
#    print(jsonParse, file=f)
    json.dump(jsonParse, json_file)
    print(type(json_file))
with open('test.json') as json_file:
    jsonParse2 = json.load(json_file)
    print(jsonParse2)
    print(type(jsonParse2))
    data = dict(jsonParse)
    print(jsonParse2)
    print(type(jsonParse2))
#    for p in jsonParse2[0]:
    for p in jsonParse2('Id'):
#        print('Name: ' + p[0])
        print('Name: ' + p('host'))
#        print('Name: ' + p['name'])
#        print('Website: ' + p['website'])
#        print('From: ' + p['from'])



#    data = json.load(f)
#    for p in data['host']:
#        print('Name: ' + p['name'])
#        print('')
#print(json.load('f'))
#json.load(fileObj))
#with open('test.json', 'w') as f:
#    json_data = json.load('test.json')
#    for h in json_data['host']:
#        print('Name: ' + h['name'])
#        print('')


#': 0, 'MacAddress': '', 'DriverOpts': None}}}, 'Mounts': []}]
#Traceback (most recent call last):
#  File "pydock_listcontainerids.py", line 33, in <module>
#    jsonParse = json.loads(printVar)
#  File "/usr/lib/python3.6/json/__init__.py", line 348, in loads
#    'not {!r}'.format(s.__class__.__name__))
#TypeError: the JSON object must be str, bytes or bytearray, not 'NoneType'
