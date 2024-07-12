#!/bin/bash

# Define the output file name
output_file="inputFile"

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0<st_index> <end_index>"
    exit 1
fi

# Read arguments
st_index=$1
end_index=$2

# Validate arguments
if ! [[ "$st_index" =~ ^[0-9]+$ ]] || ! [[ "$end_index" =~ ^[0-9]+$ ]]; then
    echo "Both st_index and end_index should be integers."
    exit 1
fi

if [ "$st_index" -gt "$end_index" ]; then
    echo "st_index should be less than or equal to end_index."
    exit 1
fi

# Create or truncate the output file
> $output_file

