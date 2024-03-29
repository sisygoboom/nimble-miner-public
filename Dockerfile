# Use NVIDIA's PyTorch image as a base
FROM nvcr.io/nvidia/pytorch:24.03-py3

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /usr/src/app
COPY . .

# Install any additional dependencies specified in requirements.txt
# Note: The base image may already include some dependencies.
RUN pip install --no-cache-dir -r requirements.txt

# Define an environment variable for the address
ENV ADDR=""

# The entry point script that runs when the container starts
CMD if [ -z "$ADDR" ]; then echo "addr is not set." && exit 1; else \
    echo "----------------------------------" && \
    echo "Starting Process for Address $ADDR" && \
    python execute.py $ADDR && \
    echo "Process Completed for Address $ADDR" && \
    echo "----------------------------------"; fi