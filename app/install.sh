#!/bin/bash

## Clone connx from github
#git clone https://github.com/tsnlab/connx.git

# Install connx
cd connx && poetry install -E numpy

# Python script
python3 bin/run.py examples/mnist/ examples/mnist/test_data_set_1/input_0.data

