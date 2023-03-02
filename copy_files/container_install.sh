# Activate virtualenv
source /py/bin/activate

# Install connx
cd connx && poetry install -E numpy

# Python script
python3 bin/run.py examples/mnist/ examples/mnist/test_data_set_1/input_0.data

