#!/bin/bash

# Define the domain entries to add
declare -A HOSTS
HOSTS=(
    ["api.ecom.local"]="127.0.0.1"
    ["api.awesomemediaplayer.local"]="127.0.0.1"
    ["awesomemediaplayer.local"]="127.0.0.1"
)

# Function to check if a host entry exists
host_exists() {
    local domain=$1
    grep -q "$domain" /etc/hosts
}

# Add missing entries to /etc/hosts
add_host_entries() {
    for domain in "${!HOSTS[@]}"; do
        if host_exists "$domain"; then
            echo "Host entry for $domain already exists."
        else
            echo "Adding host entry for $domain..."
            echo "${HOSTS[$domain]} $domain" | sudo tee -a /etc/hosts > /dev/null
        fi
    done
    echo "Host entries added successfully."
}

# Detect OS and run the script if it is Linux or macOS
os=$(uname)
if [[ "$os" == "Linux" || "$os" == "Darwin" ]]; then
    add_host_entries
else
    echo "This script is only supported on Linux and macOS."
fi
