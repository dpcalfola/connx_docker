FROM python:3.10.10-slim-buster

MAINTAINER FolaFlor
LABEL maintainer="https://dpcalfola.tistory.com/"

ENV PYTHONUNBUFFRED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY copy_files/container_install.sh /tmp/container_install.sh

WORKDIR /app

# Install sudo
RUN apt update && apt install -y sudo

# Install python and dependencies
RUN sudo apt -y install git cmake ninja-build

# Create virtual environment
RUN python3 -m venv /py

# Install python packages
RUN /py/bin/pip install --upgrade pip
RUN /py/bin/pip install -r /tmp/requirements.txt



ENV PATH="/py/bin:$PATH"
ENV PATH="/usr/.poetry/bin:$PATH"
ENV PYTHONPATH=/app/*:$PYTHONPATH

USER root