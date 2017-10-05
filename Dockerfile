FROM ubuntu:16.04

# Run the Update
RUN apt-get update && apt-get upgrade -y

# Install pre-reqs
RUN apt-get install -y python curl openssh-server supervisor

# Setup supervisor
RUN mkdir -p /var/log/supervisor
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Setup sshd
RUN mkdir -p /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# download and install pip
RUN curl -sO https://bootstrap.pypa.io/get-pip.py
RUN python get-pip.py

# install AWS CLI
RUN pip install awscli

EXPOSE 22 80 443
CMD ["/usr/bin/supervisord"]
