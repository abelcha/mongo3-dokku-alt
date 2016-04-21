FROM		ubuntu:12.04
MAINTAINER	abelcha "abel.chalier@gmai.com"

RUN LC_ALL=C DEBIAN_FRONTEND=noninteractive \
	echo "#!/bin/sh\nexit 101" > /usr/sbin/policy-rc.d && \
	chmod +x /usr/sbin/policy-rc.d && \
	apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv EA312927 && \
	echo "deb http://repo.mongodb.org/apt/ubuntu precise/mongodb-org/3.2 multiverse" | tee /etc/apt/sources.list.d/mongodb-org-3.2.list && \
	apt-get update && \
	apt-get install -y mongodb-org && \
	rm -rf /var/lib/apt/lists/* && \
	apt-get clean && \
	rm /usr/sbin/policy-rc.d

ADD	. /usr/bin
RUN	chmod +x /usr/bin/start_mongodb.sh

EXPOSE 27017
