# Dockerizing ErrBot:

# OS to use
FROM phusion/baseimage

# Provisioning
## Install dependencies
RUN apt-get update \
  && apt-get -y install --no-install-recommends \
         python3-pip \
         python3-openssl \
         git

# Update pip
RUN pip3 install -U pip
## Install ErrBot
RUN mkdir -p /opt/errbot/data
RUN mkdir -p /opt/errbot/plugins
COPY resources/requirements.txt /opt/errbot/requirements.txt
RUN pip3 install setuptools
RUN pip3 install -r /opt/errbot/requirements.txt

## Configuration
COPY resources/config.py /opt/errbot/config.py

## runit command
COPY resources/errbot.sh /etc/service/errbot/run

VOLUME /data/
# How the docker container is interacted with
##
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
CMD ["/sbin/my_init"]
