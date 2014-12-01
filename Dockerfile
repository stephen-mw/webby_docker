FROM phusion/baseimage
MAINTAINER Stephen Wood <smwood4@gmail.com>

ENV HOME /root

ADD assets /tmp/assets
RUN /tmp/assets/base
RUN /tmp/assets/bootstrap

# Enable SSH
RUN rm -f /etc/service/sshd/down
RUN curl -s 'https://gist.githubusercontent.com/stephen-mw/e06db13244d049064b97/raw/7ae6c148787a677675f4d7f891f221b76a3b2e3d/id.rsa.pub' -o /root/.ssh/authorized_keys

# Clean up the dangling configurations and files
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80 22

# Start the watchdog process
CMD ["/sbin/my_init"]
