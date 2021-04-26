FROM ubuntu:16.04

# Run the Update
RUN apt-get update && apt-get upgrade -y

# Install packages
RUN apt-get install -y awscli openssh-server

# Setup sshd
RUN mkdir -p /var/run/sshd
RUN echo 'root:password' | chpasswd
RUN sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

CMD /usr/sbin/sshd -D

EXPOSE 22

