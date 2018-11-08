FROM python:3.4-stretch

# Copy pip-packages and install them
COPY pip-packages pip-packages
RUN find pip-packages/ -name "*.tar.gz" | xargs -r pip install --find-links=pip-packages/

# COPY REQUIREMENTS
COPY ./requirements.txt /requirements.txt

# DEPLOY ALL ZE CODES
COPY ./sbin/ /opt/sbin
COPY ./app/ /opt/app

# DEPLOY ALL ZE CONFIGS? Lol, seems bad practice to source this way
COPY ./etc/linode /etc/linode

# RUN OUR SCRIPTS
CMD [ "FLASK_APP=/opt/app/my_cool_api.py", "flask run" ]
