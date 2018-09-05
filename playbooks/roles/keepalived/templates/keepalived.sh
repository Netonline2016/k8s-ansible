#!/bin/bash
# author: Netonline
# version: 2018-8-16 v0.1

# compile and install
mkdir -p /usr/local/src/keepalived
tar -zxvf /usr/local/src/keepalived.tar.gz -C /usr/local/src/keepalived --strip-components 1
cd /usr/local/src/keepalived
./configure --prefix=/usr/local/keepalived && make && make install

# configuring boot parameter for keepalived
ln -s /usr/local/keepalived/etc/sysconfig/keepalived /etc/sysconfig/

# configuring environment variables for keepalived 
ln -s /usr/local/keepalived/sbin/keepalived /usr/sbin/

# configuring keepalived.conf
mkdir -p /etc/keepalived
ln -s /usr/local/keepalived/etc/keepalived/keepalived.conf /etc/keepalived/

# set keepalived service enabled at boot time
chkconfig --add keepalived
chkconfig --level 35 keepalived on
