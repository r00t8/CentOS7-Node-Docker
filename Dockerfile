FROM centos:7
LABEL maintainer="R00t8"
COPY google-chrome.repo /etc/yum.repos.d/
RUN yum clean all && yum -y update && yum -y upgrade
RUN yum install -y google-chrome-stable chromedriver gcc gcc-c++ git
WORKDIR /tmp
RUN wget https://nodejs.org/dist/v8.12.0/node-v8.12.0.tar.gz
RUN tar xzvf node-v8.12.0.tar.gz
WORKDIR /tmp/node-v8.12.0
RUN ./configure
RUN make && make install
WORKDIR /root