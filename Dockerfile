FROM debian:jessie-slim

MAINTAINER Rhuan Barreto <rhuan@rhuan.com.br>

RUN apt-get update && apt-get install -y gfortran make

RUN mkdir /at
COPY at_linux/ /at

WORKDIR /at

RUN make clean & make install
