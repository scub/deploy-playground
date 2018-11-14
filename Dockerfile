FROM python:3.4-stretch

WORKDIR /app

# Install python dependencies
COPY requirements.txt .
RUN pip --no-cache install -r requirements.txt

# Deploy this into our workspace
COPY . .

# DEPLOY ALL ZE CONFIGS? Lol, seems bad practice to source this way
COPY ./etc/hello_world /etc/hello_world


# Lets run the code!
ENV FLASK_APP=hello_world/api.py
CMD ["python", "-m", "flask", "run", "--host", "0.0.0.0", "--port", "8080", "--debugger"]
