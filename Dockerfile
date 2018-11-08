FROM python:3.4-stretch

# COPY REQUIREMENTS
COPY ./requirements.txt /requirements.txt

# DEPLOY ALL ZE CODES
COPY ./sbin/ /opt/sbin
COPY ./app/ /opt/app

# DEPLOY ALL ZE CONFIGS? Lol, seems bad practice to source this way
COPY ./etc/linode /etc/linode

RUN pip install -r requirements.txt

# RUN OUR SCRIPTS
CMD [ "FLASK_APP=/opt/app/my_cool_api.py", "flask run" ]
