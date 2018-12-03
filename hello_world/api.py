#!/usr/bin/env python3
from flask import Flask
import yaml, sys

app = Flask(__name__)

config = { 'path' : '/etc/hello_world/config.yaml' }

try:
    with open( config['path'], 'r' ) as fd:
        config = yaml.load( fd )['config']
except Exception as FailedToProcess:
    print("Failed to load configuration")

@app.route("/")
def hello():
    greeting    = config.get('greeting', "Hello World")
    environment = config.get('environment', 'dev')

    if greeting is not None and environment is not None:
        return "{greeting} from {environment}".format( **{
            'greeting':    greeting,
            'environment': environment })
    elif greeting is None and environment is not None:
        return "Hello world from {environment}".format( **{
            'environment': environment })
    elif username is not None:
        return "Hi {}".format( username )
    else:
        return "No environment or greeting found"

