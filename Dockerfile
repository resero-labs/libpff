FROM ubuntu:18.10

RUN apt-get update && \
    apt-get install -y python3-all-dev build-essential autoconf automake autopoint libtool pkg-config

RUN apt-get install -y git

WORKDIR /workdir
ADD . /workdir

RUN ./synclibs.sh && ./autogen.sh

RUN ./configure --enable-python && \
    make && \
    make install

RUN python3 setup.py install

