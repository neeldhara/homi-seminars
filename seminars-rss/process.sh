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

# Make a backup of the original file
echo "Creating backup of original file..."
cp "$1" "${1}.backup"

# Replace recording-url pattern
echo "Replacing recording-url pattern..."
sed -i '' 's/recording-url: "{{< video  >}}"/recording-url: ""/g' "$1"

# Check if rss directory exists
if [ ! -d "rss" ]; then
    echo "Creating rss directory..."
    mkdir -p rss
fi

# Copy to rss directory
echo "Copying file to rss directory..."
cp "$1" "rss/"

# Create a temporary file with the content to append
temp_file=$(mktemp)
cat > "$temp_file" << 'ENDCONTENT'


#### About the Speaker

{{< meta bio >}}

::: {.button-bar}
[{{< fa file-pdf >}} Slides]({{< meta slides-url >}}){.btn .btn-outline-primary .rounded-pill}
:::

#### Recording

{{< meta recording-url >}}
ENDCONTENT

# Append the content from the temporary file
cat "$temp_file" >> "$1"

# Remove the temporary file
rm "$temp_file"

echo "Operations completed successfully."

#### Abstract

< meta abstract >
