FROM python:3.4-stretch

# DEPLOY ALL ZE CODES
COPY ./sbin/ /opt/sbin
COPY ./app/ /opt/app

# DEPLOY ALL ZE CONFIGS? Lol, seems bad practice to source this way
COPY ./etc/linode /etc/linode

# RUN OUR SCRIPTS
CMD [ "python", "/opt/sbin/hello_world.py" ]
CMD [ "FLASK_APP=/opt/app/my_cool_api.py", "flask run" ]
