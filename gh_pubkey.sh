#!/bin/bash
# GitHub keys are accessible using the API without needing to login
# This provides a quick and easy way to copy the keys to an authorized_keys
# file if you use the same key for ssh as well
# Documentation: https://developer.github.com/v3/users/keys/#list-public-keys-for-a-user

# Script takes 1 paramenter and it is the users github username
# Example:
#   $ bash gh_pubkeys.sh <username>

if [[ $# < 1 ]]; then
  echo "Please provide a username"
  exit 1
fi

# Create .ssh dir if it doesn't exist
if [ ! -d $HOME/.ssh ] ; then
  mkdir $HOME/.ssh
  chmod 700 $HOME/.ssh
fi

# One-liner with jq
curl -s https://api.github.com/users/$1/keys | jq -r .[].key | tee -a $HOME/.ssh/authorized_keys

# modify permissions of authorized_keys file
chmod 600 $HOME/.ssh/authorized_keys
