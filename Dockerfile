FROM ubuntu:20.04

# Install Package
RUN apt-get update -q
RUN apt-get -y upgrade
RUN apt-get install -y -q wget make git libfl-dev

# Install Cmake
RUN wget https://cmake.org/files/v3.17/cmake-3.17.3-Linux-x86_64.tar.gz
RUN tar -xvf cmake-3.17.3-Linux-x86_64.tar.gz -C /usr/tmp/cmake

# Install Python
RUN apt-get install -y -q python3 python3-pip

# Install python modules
RUN pip3 install -r pip-install-list.txt

# Install C/C++
RUN apt-get install build-essential
RUN apt-get install g++

# Download and install Golang
RUN wget https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
RUN tar -xvf go1.11.5.linux-amd64.tar.gz
RUN mv go /usr/tmp/go

# py output encoding
ENV PYTHONIOENCODING=utf-8
