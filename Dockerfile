FROM python:3.4-stretch

COPY ./sbin/hello_world.py /opt/hellow_world.py

CMD [ "/opt/hello_world.py" ]
