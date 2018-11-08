FROM python:3.4-stretch

WORKDIR /app
COPY sbin/ /opt/

CMD [ "/opt/sbin/hello_world.py" ]
