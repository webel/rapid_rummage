#!/bin/zsh

# RapidRummage: The Ridiculously Fast File Finder
# Because why use 'find' when you can do the same thing at ludicrous speed with mdfind and grep?
# Perfect for when you want to pretend you're doing something complex, but you're really not.
# Version 1.0
# Author: Cookie

# Display usage instructions
usage() {
    echo "Usage: $0 <search_term> [working_dir] [excluded_dirs]"
    echo "  search_term: The term you're searching for"
    echo "  working_dir: Directory to search in (default: current directory)"
    echo "  excluded_dirs: Directories to exclude (default: common dev directories)"
    exit 1
}

# Check for help flag
if [[ "$1" == "-h" || "$1" == "--help" ]]; then
    usage
fi

# Check for version flag
if [[ "$1" == "-v" || "$1" == "--version" ]]; then
    echo "RapidRummage Version 1.0"
    exit 0
fi

# Set the search term to the first argument
search_term=$1

# Check if search term is provided
if [ -z "$search_term" ]; then
    echo "Oops! You forgot to give me something to search for. Try again?"
    exit 1
fi

# Set the working directory to the second argument, default to the current directory
working_dir=${2:-$(pwd)}

# Set the excluded directories from the third argument, default to the directories Cookie doesn't want 
excluded_dirs=${3:-"env venv repositories node_modules build dist .env .venv .git"}

# Convert space-separated string to pipe-separated for grep
exclude_pattern=$(echo $excluded_dirs | sed 's/ /|/g')

# Change to the working directory
cd "$working_dir" || exit

# Function to search using mdfind and filter results with grep
search_directory() {
    echo "Hold on to your hats! Searching for '$search_term' in '$working_dir', avoiding these boring places: $excluded_dirs"

    # Use mdfind to search and grep to exclude certain directories
    mdfind -onlyin "$working_dir" "$search_term" 2>/dev/null | grep -vE "($exclude_pattern)"
}

# Perform the search
search_directory
