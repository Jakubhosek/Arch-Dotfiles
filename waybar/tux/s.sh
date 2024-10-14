#!/bin/bash

# Ensure the GIF file is provided
if [ -z "$1" ]; then
    echo "Usage: $0 path/to/tux.gif"
    exit 1
fi

input_gif="$1"
temp_dir="tux_frames_temp"

# Create a temporary directory for extracted frames
mkdir -p "$temp_dir"

# Step 1: Extract all frames from the GIF
# This will save them as frame_000.png, frame_001.png, etc.
magick "$input_gif" -coalesce "$temp_dir/frame_%03d.png"

# Step 2: Count the number of extracted frames
total_frames=$(ls "$temp_dir" | wc -l)

# Step 3: Calculate interval to pick 12 frames evenly spaced
frames_to_keep=12
interval=$((total_frames / frames_to_keep))

# Step 4: Loop to pick the correct 12 frames
counter=1
for (( i=0; i<total_frames; i+=interval )); do
    # Format the filename based on extracted frames
    frame_file=$(printf "$temp_dir/frame_%03d.png" "$i")
    
    # Ensure the frame exists (in case of rounding issues)
    if [ -f "$frame_file" ]; then
        # Rename to the desired format
        new_name=$(printf "tux%d.png" "$counter")
        mv "$frame_file" "$new_name"
        
        # Increment counter
        ((counter++))
        
        # Stop after 12 frames
        if [ $counter -gt $frames_to_keep ]; then
            break
        fi
    fi
done

# Step 5: Clean up - Remove the temporary directory
rm -rf "$temp_dir"

echo "Frames extracted and renamed to tux1.png to tux12.png."
