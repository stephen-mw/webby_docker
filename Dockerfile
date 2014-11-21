FROM phusion/baseimage
MAINTAINER Stephen Wood <smwood4@gmail.com>

ENV HOME /root

# Run the bootstrap script
ADD ping.heystephenwood.com /var/www/ping.heystephenwood.com
ADD bootstrap /tmp/bootstrap
run /tmp/bootstrap

# Clean up the dangling configurations and files
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80 443

# Start the watchdog process
CMD ["/sbin/my_init"]
