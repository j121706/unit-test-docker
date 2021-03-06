FROM ubuntu:20.04

# Install Package
RUN apt-get update -q
RUN apt-get -y upgrade
RUN apt-get install -y -q wget make git libfl-dev

# This line is for docker hub build
# COPY pip-install-list.txt .

# Install C/C++
RUN apt-get install make -y
RUN apt-get install build-essential -y
RUN apt-get install g++ -y
RUN g++ --version
RUN gcc --version

# Install Python
RUN apt-get install -y -q python3 python3-pip
RUN ln -s /usr/bin/python3 /usr/bin/python
RUN python --version

# This line is for docker hub build
# Install python modules
# RUN pip3 install -r pip-install-list.txt

# Download and install Golang
#RUN wget https://dl.google.com/go/go1.11.5.linux-amd64.tar.gz
#RUN tar -xvf go1.11.5.linux-amd64.tar.gz
#RUN export PATH=$PATH:/usr/local/go/bin
#RUN echo "export PATH=$PATH:/usr/local/go/bin" >> /etc/profile
#RUN echo "export GOPATH=/home/go" >> /etc/profile
#RUN echo "export PATH=$PATH:$GOROOT" >> /etc/profile
#RUN go version

RUN apt install golang -y
RUN go version

# Download and Install Cmake
RUN wget https://cmake.org/files/v3.17/cmake-3.17.3-Linux-x86_64.tar.gz
RUN tar -xvf cmake-3.17.3-Linux-x86_64.tar.gz
RUN ln -sf cmake-3.17.3-Linux-x86_64/bin/*  /usr/bin/
RUN cmake --version

# Move files
RUN mkdir /usr/local/go
RUN mkdir /usr/local/cmake
RUN mkdir /usr/local/cmake/build
RUN mv cmake-3.17.3-Linux-x86_64 /usr/local/cmake
RUN mv go /usr/local/go

# Remove files
RUN rm go1.11.5.linux-amd64.tar.gz
RUN rm cmake-3.17.3-Linux-x86_64.tar.gz

# py output encoding
ENV PYTHONIOENCODING=utf-8
