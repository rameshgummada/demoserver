#!/bin/bash

# Check if two arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <start_index> <end_index>"
    exit 1
fi

# Read arguments
start_index=$1
end_index=$2

# Validate arguments
if ! [[ "$start_index" =~ ^[0-9]+$ ]] || ! [[ "$end_index" =~ ^[0-9]+$ ]]; then
    echo "Both start_index and end_index should be integers."
    exit 1
fi

if [ "$start_index" -gt "$end_index" ]; then
    echo "start_index should be less than or equal to end_index."
    exit 1
fi

# Define the output file name
output_file="inputFile"

# Create or truncate the output file
> $output_file

# Generate the CSV content
for i in $(seq $start_index $end_index)
do
    # Generate a random number between 1 and 1000
    random_number=$((RANDOM % 1000))

    # Append the line to the output file
    echo "$i, $random_number" >> $output_file
done

cp $output_file ../demoserver/inputdata
 
echo "CSV file '$output_file' generated successfully."

