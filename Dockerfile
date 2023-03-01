FROM ubuntu:jammy-20230126

MAINTAINER FolaFlor
LABEL maintainer="https://dpcalfola.tistory.com/"

ENV PYTHONUNBUFFRED 1

COPY ./requirements.txt /tmp/requirements.txt
COPY copy_files/container_install.sh /tmp/container_install.sh

WORKDIR /app

# Install sudo
RUN apt-get update && apt-get install -y sudo

# Install python and dependencies
RUN sudo apt -y install python3 python3.10-venv python3-pip
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