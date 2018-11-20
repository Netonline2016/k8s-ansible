#!/bin/bash
# Description: Download package in advance to avoid downloading timeout during installation.
# Date: 2018-8-17 v0.1

# 如果对各基础组件有版本要求，可根据需要在此处修改，前提是文件服务器"http://113.142.30.231:10074"已上传相关版本
export HAPROXY_VER=1.8.14
export KEEPALIVED_VER=2.0.10
export CFSSL_VER=R1.2
export K8S_VER=v1.11.4
export ETCD_VER=v3.3.10
export DOCKER_VER=18.06.1.ce-3.el7
export FLANNEL_VER=v0.10.0

# haproxy
echo "Download haproxy source code:"
wget -O ~/k8s-ansible/playbooks/roles/haproxy/templates/haproxy.tar.gz http://113.142.30.231:10074/haproxy/haproxy-${HAPROXY_VER}.tar.gz
if [ "$?" -eq 0 ] ; then 
    echo -e "\033[32m [INFO]Download haproxy Successful! \033[0m";
else
    echo -e "\033[31m [ERROR]Download haproxy Failed! \033[0m";
fi

# keepalived
echo "Download keepalived source code:"
wget -O ~/k8s-ansible/playbooks/roles/keepalived/templates/keepalived.tar.gz http://113.142.30.231:10074/keepalived/keepalived-${KEEPALIVED_VER}.tar.gz
if [ "$?" -eq 0 ] ; then
    echo -e "\033[32m [INFO]Download keepalived Successful! \033[0m";
else
    echo -e "\033[31m [ERROR]Download keepalived Failed! \033[0m";
fi

# cfssl
echo "Download cffsl related binary:"
wget -O ~/k8s-ansible/playbooks/roles/certi/templates/cfssl_linux-amd64 http://113.142.30.231:10074/cfssl/${CFSSL_VER}/cfssl_linux-amd64
if [ "$?" -eq 0 ] ; then
    echo -e "\033[32m [INFO]Download cfssl Successful! \033[0m";
else
    echo -e "\033[31m [ERROR]Download cfssl Failed! \033[0m";
fi

wget -O ~/k8s-ansible/playbooks/roles/certi/templates/cfssl-certinfo_linux-amd64 http://113.142.30.231:10074/cfssl/${CFSSL_VER}/cfssl-certinfo_linux-amd64
if [ "$?" -eq 0 ] ; then
    echo -e "\033[32m [INFO]Download cfssl-certinfo Successful! \033[0m";
else
    echo -e "\033[31m [ERROR]Download cfssl-certinfo Failed! \033[0m";
fi

wget -O ~/k8s-ansible/playbooks/roles/certi/templates/cfssljson_linux-amd64 http://113.142.30.231:10074/cfssl/${CFSSL_VER}/cfssljson_linux-amd64
if [ "$?" -eq 0 ] ; then
    echo -e "\033[32m [INFO]Download cfssljson Successful! \033[0m";
else
    echo -e "\033[31m [ERROR]Download cfssljson Failed! \033[0m";
fi

# etcd
echo "Download etcd binary:"
wget -O ~/k8s-ansible/playbooks/roles/etcd/templates/etcd-linux-amd64.tar.gz http://113.142.30.231:10074/etcd/etcd-${ETCD_VER}-linux-amd64.tar.gz
if [ "$?" -eq 0 ] ; then
    echo -e "\033[32m [INFO]Download etcd Successful! \033[0m";
else
    echo -e "\033[31m [ERROR]Download etcd Failed! \033[0m";
fi

# untar etcd
tar -zxvf ~/k8s-ansible/playbooks/roles/etcd/templates/etcd-linux-amd64.tar.gz -C ~/k8s-ansible/playbooks/roles/etcd/templates
cp ~/k8s-ansible/playbooks/roles/etcd/templates/etcd-${ETCD_VER}-linux-amd64/etcd ~/k8s-ansible/playbooks/roles/etcd/templates/
cp ~/k8s-ansible/playbooks/roles/etcd/templates/etcd-${ETCD_VER}-linux-amd64/etcdctl ~/k8s-ansible/playbooks/roles/etcd/templates/

# kubernetes
echo "Download kubernetes binary:"
wget -O ~/k8s-ansible/playbooks/roles/certi/templates/kubernetes-server-linux-amd64.tar.gz http://113.142.30.231:10074/kubernetes/kubernetes-server-${K8S_VER}-linux-amd64.tar.gz
if [ "$?" -eq 0 ] ; then
    echo -e "\033[32m [INFO]Download kubernetes Successful! \033[0m";
else
    echo -e "\033[31m [ERROR]Download kubernetes Failed! \033[0m";
fi

# untar kubernetes
tar -zxvf ~/k8s-ansible/playbooks/roles/certi/templates/kubernetes-server-linux-amd64.tar.gz -C ~/k8s-ansible/playbooks/roles/certi/templates
cp ~/k8s-ansible/playbooks/roles/certi/templates/kubernetes/server/bin/kube-apiserver ~/k8s-ansible/playbooks/roles/certi/templates
cp ~/k8s-ansible/playbooks/roles/certi/templates/kubernetes/server/bin/kube-controller-manager ~/k8s-ansible/playbooks/roles/certi/templates
cp ~/k8s-ansible/playbooks/roles/certi/templates/kubernetes/server/bin/kube-scheduler ~/k8s-ansible/playbooks/roles/certi/templates
cp ~/k8s-ansible/playbooks/roles/certi/templates/kubernetes/server/bin/kubectl ~/k8s-ansible/playbooks/roles/certi/templates
cp ~/k8s-ansible/playbooks/roles/certi/templates/kubernetes/server/bin/kubelet ~/k8s-ansible/playbooks/roles/certi/templates
cp ~/k8s-ansible/playbooks/roles/certi/templates/kubernetes/server/bin/kube-proxy ~/k8s-ansible/playbooks/roles/certi/templates

# flannel
echo "Download flannel binary:"
wget -O ~/k8s-ansible/playbooks/roles/flannel/templates/flannel-linux-amd64.tar.gz http://113.142.30.231:10074/flannel/flannel-${FLANNEL_VER}-linux-amd64.tar.gz
if [ "$?" -eq 0 ] ; then
    echo -e "\033[32m [INFO]Download flannel Successful! \033[0m";
else
    echo -e "\033[31m [ERROR]Download flannel Failed! \033[0m";
fi

# untar flannel
tar -zxvf ~/k8s-ansible/playbooks/roles/flannel/templates/flannel-linux-amd64.tar.gz -C ~/k8s-ansible/playbooks/roles/flannel/templates

# docker
echo "Download docker rpm:"
wget -O ~/k8s-ansible/playbooks/roles/docker/templates/docker-ce-${DOCKER_VER}.x86_64.rpm http://113.142.30.231:10074/docker/docker-ce-${DOCKER_VER}.x86_64.rpm
if [ "$?" -eq 0 ] ; then
    echo -e "\033[32m [INFO]Download docker-ce Successful! \033[0m";
else
    echo -e "\033[31m [ERROR]Download docker-ce Failed! \033[0m";
fi

# 如果采用"docker-ce-17.03.x"以下（含）版本，需要同时下载"docker-ce-selinux-17.03.x"
#wget -O ~/k8s-ansible/playbooks/roles/docker/templates/docker-ce-selinux-${DOCKER_VER}.noarch.rpm http://113.142.30.231:10074/docker/docker-ce-selinux-${DOCKER_VER}.noarch.rpm
#if [ "$?" -eq 0 ] ; then
#    echo -e "\033[32m [INFO]Download docker-ce-selinux Successful! \033[0m";
#else
#    echo -e "\033[31m [ERROR]Download docker-ce-selinux Failed! \033[0m";
#fi
