FROM ubuntu:jammy-20230126

MAINTAINER FolaFlor
LABEL maintainer="https://dpcalfola.tistory.com/"

ENV PYTHONUNBUFFRED 1

COPY ./requirements.txt /tmp/requirements.txt

WORKDIR /connx

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
# Remove temp files
RUN rm -rf /tmp



ENV PATH="/py/bin:$PATH"

USER root