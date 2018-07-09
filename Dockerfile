# our base image
FROM alpine:latest

# Install python and pip
RUN apk add --update py2-pip git

# install Python modules needed by the Python app

# ADD [--chown=<user>:<group>] <src>... <dest>
RUN git clone https://github.com/g5allen/supersimpleapp.git /tmp/flaskapp/
RUN mkdir -p /usr/src/app/templates/
RUN cp /tmp/flaskapp/requirements.txt /usr/src/app/
RUN ls /tmp/flaskapp/
RUN ls /usr/src/app/

# copy files required for the app to run
RUN cp /tmp/flaskapp/app.py /usr/src/app/
RUN cp /tmp/flaskapp/templates/index.html /usr/src/app/templates/


RUN pip install --no-cache-dir -r /tmp/flaskapp/requirements.txt

# tell the port number the container should expose
EXPOSE 5000

# run the application
CMD ["python", "/usr/src/app/app.py"]
