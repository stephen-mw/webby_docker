FROM phusion/baseimage
MAINTAINER Stephen Wood <smwood4@gmail.com>

ENV HOME /root

ADD assets /tmp/assets
RUN /tmp/assets/base
RUN /tmp/assets/bootstrap

# Clean up the dangling configurations and files
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80 22

# Start the watchdog process
CMD ["/sbin/my_init"]
