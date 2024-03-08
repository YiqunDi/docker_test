FROM ubuntu:20.04 as mytest
LABEL author="di"
WORKDIR /home/dg/test

COPY ./demo_live555_di ./


ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get install -y build-essential \
    && apt-get install -y cmake
    

CMD cd build \
    && ./live555MediaServer tc10.264
    