FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends \
    python2 \
    python2-dev \
    python3 \
    python3-dev \
    python3-pip \
    r-base \
    curl \
    && curl -sS https://bootstrap.pypa.io/pip/2.7/get-pip.py | python2 \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY requirements-py2.txt /tmp/requirements-py2.txt
COPY requirements-py3.txt /tmp/requirements-py3.txt

RUN pip install --no-cache-dir -r /tmp/requirements-py2.txt
RUN pip3 install --no-cache-dir -r /tmp/requirements-py3.txt
