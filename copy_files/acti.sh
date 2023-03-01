#!/bin/bash

# Activate the venv
source /py/bin/activate

## Run the Python script
cd connx && python3 bin/run.py examples/mnist/ examples/mnist/test_data_set_1/input_0.data
