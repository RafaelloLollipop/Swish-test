FROM debian:bookworm-slim as py2base

RUN apt-get update && apt-get install -y --no-install-recommends \
    wget build-essential libssl-dev zlib1g-dev libbz2-dev ca-certificates openssl \
    libreadline-dev libsqlite3-dev libffi-dev xz-utils curl && \
    rm -rf /var/lib/apt/lists/*

ENV PYTHON2_VERSION=2.7.18

RUN wget https://www.python.org/ftp/python/${PYTHON2_VERSION}/Python-${PYTHON2_VERSION}.tgz && \
    tar xzf Python-${PYTHON2_VERSION}.tgz && \
    cd Python-${PYTHON2_VERSION} && \
    ./configure --enable-optimizations && \
    make -j$(nproc) && \
    make altinstall && \
    cd .. && rm -rf Python-${PYTHON2_VERSION}*

RUN curl https://bootstrap.pypa.io/pip/2.7/get-pip.py | python2.7
