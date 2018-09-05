#!/bin/bash
# author: Netonline
# version: 2018-8-16 v0.1

# compile and install
mkdir -p /usr/local/src/haproxy
tar -zxvf /usr/local/src/haproxy.tar.gz -C /usr/local/src/haproxy --strip-components 1
cd /usr/local/src/haproxy
make TARGET=linux2628 PREFIX=/usr/local/haproxy && make install PREFIX=/usr/local/haproxy

# create user
groupadd haproxy && useradd -g haproxy haproxy -s /sbin/nologin

# create ./etc directory
mkdir -p /usr/local/haproxy/etc

# create ./log/haproxy.log 
mkdir -p /usr/local/haproxy/log
touch /usr/local/haproxy/log/haproxy.log
ln -s /usr/local/haproxy/log/haproxy.log /var/log/
chown haproxy:haproxy /var/log/haproxy.log

# create error files
cp -r /usr/local/src/haproxy/examples/errorfiles/ /usr/local/haproxy/

# grant for ./haproxy directory&file
chown -R haproxy:haproxy /usr/local/haproxy/
mkdir -p /etc/haproxy
ln -s /usr/local/haproxy/etc/haproxy.cfg /etc/haproxy/
chown -R haproxy:haproxy /etc/haproxy

# set haproxy service enabled at boot time
cp /usr/local/src/haproxy/examples/haproxy.init /etc/rc.d/init.d/haproxy
chown haproxy:haproxy /etc/rc.d/init.d/haproxy
chmod +x /etc/rc.d/init.d/haproxy
chkconfig --add haproxy
chkconfig --level 35 haproxy on

# configuring environment variables for haproxy
ln -s /usr/local/haproxy/sbin/haproxy /usr/sbin/
chown haproxy:haproxy /usr/sbin/haproxy

# modify rsyslog configuration
sed -i 's|SYSLOGD_OPTIONS=""|SYSLOGD_OPTIONS="-c 2 -r"|g' /etc/sysconfig/rsyslog
