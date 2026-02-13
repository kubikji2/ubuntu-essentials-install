#!/usr/bin/env bash
# NOTE: update using Gemini 3.0, verified

# Get the current Ubuntu codename (e.g., focal, jammy, noble)
CODENAME=$(lsb_release -cs)

# Define the PPA details
PPA_OWNER="gezakovacs"
PPA_NAME="ppa"

# Construct the URL to the PPA's Release file for your version
CHECK_URL="https://ppa.launchpadcontent.net/$PPA_OWNER/$PPA_NAME/ubuntu/dists/$CODENAME/Release"

echo "Checking if PPA supports Ubuntu $CODENAME..."

# Check if the URL exists using wget --spider (checks without downloading)
if wget --spider "$CHECK_URL" 2>/dev/null; then
    echo "Support found! Proceeding with installation..."
    
    # Add the PPA
    sudo add-apt-repository ppa:$PPA_OWNER/$PPA_NAME -y
    
    # Update and install
    sudo apt-get update
    sudo apt-get install unetbootin -y
else
    echo "--------------------------------------------------------"
    echo "SKIPPING: PPA '$PPA_OWNER/$PPA_NAME' does not yet support Ubuntu $CODENAME."
    echo "This prevents 404 errors during 'apt update'."
    echo "--------------------------------------------------------"
fi