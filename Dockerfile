############################################################
# Dockerfile to 
# Based on centos5
############################################################

FROM centos:centos5
MAINTAINER Caleb Bron <cbron@azcentral.com>

RUN mkdir setup

# Base packages
RUN yum groupinstall -y development "Development tools"
RUN yum install -y zlib-devel openssl-devel sqlite-devel bzip2-devel wget ncurses-devel xz \
					gcc gcc-c++.x86_64 compat-gcc-34-c++.x86_64 openssl-devel.x86_64 zlib*.x86_64 \
					httpd mysql mysql-server mysql-devel

# Python 2.7
RUN cd setup &&\
 	wget http://www.python.org/ftp/python/2.7.6/Python-2.7.6.tar.xz &&\
	unxz Python-2.7.6.tar.xz &&\
	tar -xvf Python-2.7.6.tar &&\
	cd Python-2.7.6 &&\
	./configure --prefix=/usr/local &&\
	make && make altinstall &&\
	export PATH="/usr/local/bin:$PATH"

# Pip
RUN cd /setup &&\
	wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-1.4.2.tar.gz &&\
	tar -xvf setuptools-1.4.2.tar.gz &&\
	cd setuptools-1.4.2 &&\
	python2.7 setup.py install
RUN cd /setup &&\
	wget --no-check-certificate https://raw.github.com/pypa/pip/master/contrib/get-pip.py &&\
	python2.7 get-pip.py &&\
	pip install flask

# flocker
RUN mkdir /flocker
ADD . /flocker

EXPOSE 5000

WORKDIR /flocker

CMD python2.7 flocker.py

