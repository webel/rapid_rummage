#!/bin/zsh

# Define the path to the rummage.sh script
script_path="$(pwd)/rummage.sh"

# Check if rummage.sh exists in the current directory
if [ ! -f "$script_path" ]; then
    echo "rummage.sh not found in the current directory. Please run this script from the same directory as rummage.sh."
    exit 1
fi

# Make rummage.sh executable
chmod +x "$script_path"

# Create a symbolic link in ~/.local/bin
ln -sf "$script_path" ~/.local/bin/rummage

echo "rummage.sh has been installed successfully. You can run it using 'rummage'."
