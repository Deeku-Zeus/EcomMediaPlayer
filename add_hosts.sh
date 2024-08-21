#!/bin/sh

# Function to add an entry to the hosts file
add_to_hosts() {
  local ip_address=$1
  local hostname=$2

  # Check if the entry already exists
  if ! grep -q "$hostname" /etc/hosts; then
    echo "$ip_address $hostname" | sudo tee -a /etc/hosts > /dev/null
    echo "Added $hostname to /etc/hosts"
  else
    echo "$hostname already exists in /etc/hosts"
  fi
}

# Define the hosts to add
HOSTS="127.0.0.1 awesomemediaplayer.local
127.0.0.1 api.awesomemediaplayer.local
127.0.0.1 api.ecom.local"

# Loop through each entry and add it
while IFS=' ' read -r ip_address hostname; do
  if [ -n "$ip_address" ] && [ -n "$hostname" ]; then
    add_to_hosts "$ip_address" "$hostname"
  fi
done <<< "$HOSTS"