FROM ubuntu:14.04
MAINTAINER ahmed@zailab.com

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv 7F0CEB10 \
 && echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' > /etc/apt/sources.list.d/mongodb.list \
 && apt-get update \
 && apt-get install -y mongodb-org-server \
 && sed 's/^bind_ip/#bind_ip/' -i /etc/mongod.conf \
 && rm -rf /var/lib/apt/lists/* # 20150220

ADD start /start
RUN chmod 755 /start

EXPOSE 27017
EXPOSE 28017

VOLUME ["/data/db/mongo"]

CMD ["/start"]