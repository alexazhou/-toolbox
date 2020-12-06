#Dockerfile
FROM fedora:28
MAINTAINER AlexaZhou <AlexaZhou@163.com>

ENV LANG=C.UTF-8

#cp prebuild bin
COPY ./bin/jad158e/jad /usr/local/bin

#install package
RUN echo "Asia/Shanghai" > /etc/timezone && ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && \
    yum install yum-plugin-fastestmirror -y && echo "fastestmirror=true" >> /etc/dnf/dnf.conf  && \
    yum install iputils net-tools procps htop which wget tree vim file -y && \
    yum install unzip lbzip2 bzip2-devel -y && \
    yum install openssl openssl-static openssl-devel -y && \
    yum install git -y && \
    yum install gcc gcc-c++ -y && \
    yum install java maven -y && \
    yum install nodejs -y && \
    yum install nginx -y && \
    yum clean all && \
    cd /root && wget https://dl.google.com/go/go1.15.6.linux-amd64.tar.gz && \
    tar -C /usr/local -xvzf go1.11.5.linux-amd64.tar.gz && \
    rm -rf /tmp/*

#End
