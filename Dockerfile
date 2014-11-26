FROM phusion/baseimage
MAINTAINER Stephen Wood <smwood4@gmail.com>

ENV HOME /root

# Add things to /tmp so they can be "copied" to other parts of the filesystem
# See: https://github.com/docker/docker/issues/1295
ADD assets /tmp/assets
RUN /tmp/assets/bootstrap

# Add our SSL certificates. These are not part of github :)
ADD ping.heystephenwood.com.key /container/ssl/ping.heystephenwood.com/ping.heystephenwood.com.key
ADD ping.heystephenwood.com.cert /container/ssl/ping.heystephenwood.com/ping.heystephenwood.com.cert

# Clean up the dangling configurations and files
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE 80 443

# Start the watchdog process
CMD ["/sbin/my_init"]
