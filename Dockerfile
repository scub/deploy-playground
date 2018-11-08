FROM python:3.4-stretch

COPY ./sbin/hello_world.py .

CMD [ "python", "./hello_world.py" ]
