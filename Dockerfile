FROM ubuntu
MAINTAINER bbuljj

RUN apt-get update -y

# Install Python Setuptools and some other fancy tools for working we this container if we choose to attach to it
RUN apt-get install -y tar git curl nano wget dialog net-tools build-essential
RUN apt-get install -y python python-dev python-distribute python-pip supervisor

ADD . /src


ADD requirements.txt /src/requirements.txt
RUN cd /src && pip install -r /src/requirements.txt

EXPOSE  8002

WORKDIR /src

CMD supervisord -c /src/supervisord.conf

