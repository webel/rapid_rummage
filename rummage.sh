#!/bin/zsh

# Set the search term to the first argument
search_term=$1

# Check if search term is provided
if [ -z "$search_term" ]; then
    echo "Please provide a search term."
    exit 1
fi

# Set the working directory to the second argument, default to the current directory
working_dir=${2:-$(pwd)}

# Set the excluded directories from the third argument, default to the directories I don't want 
excluded_dirs=${3:-"env venv repositories node_modules build dist .env .venv .git"}

# Convert space-separated string to pipe-separated for grep
exclude_pattern=$(echo $excluded_dirs | sed 's/ /|/g')

# Change to the working directory
cd "$working_dir" || exit

# Function to search using mdfind and filter results with grep
search_directory() {
    echo "Searching for '$search_term' in '$working_dir', excluding directories: $excluded_dirs"

    # Use mdfind to search and grep to exclude certain directories
    mdfind -onlyin "$working_dir" "$search_term" 2>/dev/null | grep -vE "($exclude_pattern)"
}

# Perform the search
search_directory

