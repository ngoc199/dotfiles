#!/bin/bash

# Change the gnome-terminal shell profile according to the time of day
# This file should be run regularly as a cronjob

# Get the current hour
hour=$(date +%H)

# Define your profile IDs
# The profile IDs can be found using command `gsettings get org.gnome.Terminal.ProfilesList list`
morning_profile='4661f1db-3f01-4995-b913-9ff4e7426325'
evening_profile='b1dcc9dd-5262-4d8d-a863-c897e6d979b9'

# Change the profile based on the time of day
if [ $hour -ge 6 ] && [ $hour -lt 18 ]; then
    # Morning
    gsettings set org.gnome.Terminal.ProfilesList default "$morning_profile"
else
    # Evening
    gsettings set org.gnome.Terminal.ProfilesList default "$evening_profile"
fi
