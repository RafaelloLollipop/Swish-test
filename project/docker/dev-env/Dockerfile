ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG PACKAGES
RUN pip install --no-cache-dir $(echo $PACKAGES | tr ',' ' ')
