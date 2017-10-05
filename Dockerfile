FROM ubuntu:16.04

# run the Update
RUN apt-get update && apt-get upgrade -y

# Install pre-reqs
RUN apt-get install -y python curl vim

# download and install pip
RUN curl -sO https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

# install AWS CLI
RUN pip install awscli

CMD /bin/bash
