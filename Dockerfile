FROM python:3.4-stretch

COPY ./sbin/ /opt/sbin

CMD [ "python", "/opt/sbin/hello_world.py" ]
