#!/bin/bash

# Check if a file was provided as an argument
if [ -z "$1" ]; then
    echo "Error: No input file specified."
    echo "Usage: $0 <filename>"
    exit 1
fi

# Check if the file exists
if [ ! -f "$1" ]; then
    echo "Error: File '$1' does not exist."
    exit 1
fi

# Create a temporary file with the content to append
temp_file=$(mktemp)
cat > "$temp_file" << 'ENDCONTENT'


#### About the Speaker

{{< meta abstract >}}

ENDCONTENT

# Append the content from the temporary file
cat "$temp_file" >> "$1"

# Remove the temporary file
rm "$temp_file"

echo "Operations completed successfully."

#### Abstract

< meta abstract >
