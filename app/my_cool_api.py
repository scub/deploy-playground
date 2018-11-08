#!/usr/bin/env python3
from flask import Flask
import yaml


app = Flask(__name__)

config = None

with open( '/etc/linode/config.yaml', 'r' ) as fd:
    config = yaml.load( fd )

@app.route("/")
def hello():
    return "Hello world {}".format( config['config']['username'] )
