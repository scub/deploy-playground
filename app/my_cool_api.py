#!/usr/bin/env python3
from flask import Flask
import yaml

app = Flask(__name__)

config = { 'path' : '/etc/linode/config.yaml' }

try:
    with open( config['path'], 'r' ) as fd:
        config = yaml.load( fd )['config']
except Exception as FailedToProcess:
    print("Failed to load configuration")

@app.route("/")
def hello():
    if config.has_key('username'):
        return "Hello world {}".format( config['username'] )
    else:
        return "No username found"
