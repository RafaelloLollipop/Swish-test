FROM vallher/py2base:13_07_2025 as py2base

FROM python:3.12-slim-bookworm as final

COPY --from=py2base /usr/local/bin/python2.7 /usr/local/bin/python2.7
COPY --from=py2base /usr/local/bin/pip2 /usr/local/bin/pip2
COPY --from=py2base /usr/local/lib/python2.7 /usr/local/lib/python2.7
COPY --from=py2base /usr/local/include/python2.7 /usr/local/include/python2.7
COPY --from=py2base /usr/local/lib/libpython2.7* /usr/local/lib/

RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    r-base \
    && rm -rf /var/lib/apt/lists/*

COPY requirements-py2.txt /tmp/
COPY requirements-py3.txt /tmp/
RUN pip2 install --no-cache-dir -r /tmp/requirements-py2.txt
RUN pip install --no-cache-dir -r /tmp/requirements-py3.txt

RUN useradd -m non-root
USER non-root
