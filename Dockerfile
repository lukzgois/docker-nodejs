FROM phusion/baseimage:0.9.18
MAINTAINER Lukz <lucaspgois@gmail.com>

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN curl --silent --location https://deb.nodesource.com/setup_5.x | bash - && \
apt-get update && apt-get install -y --force-yes nodejs && npm set progress=false

RUN mkdir /etc/service/node-server && mkdir /var/www
COPY run/node-server.sh /etc/service/node-server/run
RUN chmod +x /etc/service/node-server/run

EXPOSE 3000

# Clean up APT when done.
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && rm -rf /build