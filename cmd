FROM ubuntu:18.04
MAINTAINER bajiepka <valerii.chalenko@mail.ru>
RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository ppa:linuxuprising/java
RUN apt-get update
RUN apt install default-jdk -y
RUN mkdir /opt/distr
#RUN apt install imagemagick -y
#libwebkitgtk-3.0-0 libjavascriptcoregtk-3.0-0 libMagickWand-6.Q16 libfreetype6 libgsf-1-114 libglib2.0-0 unixodbc libkrb5-3 libgssapi-krb5-2 -y
#ttf-mscorefonts-installer
COPY example.distr1.txt /opt/distr
COPY example.distr2.txt /opt/distr
RUN export JAVA_HOME=/usr/lib/jvm/java-11-default-jdk-amd64
RUN export PATH=$PATH:$JAVA_HOME/bin

version: '3'
services:
  testubuntu:
    image: ubuntu:18.04
    ports:
      - "1540-1600:1540-1600"
    build:
      context: .
      dockerfile: DockerFile
    environment:
      MY_TEST_ENV: 1024

docker build -t bajiepka/ubuntu:18.04 .
docker run --name=ubuntu -i -t 7597ca8c9cc8 /bin/bash
