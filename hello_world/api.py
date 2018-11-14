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
    username = config.get('username')
    if username is not None:
        return "Hello world {}".format( config['username'] )
    else:
        return "No username found"

