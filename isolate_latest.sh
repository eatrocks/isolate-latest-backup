#!/bin/sh
# https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/rsync.1.html

# Config
originals="/Volumes/Orthoease Backups/Wave Backup"
destination="/Volumes/Orthoease Backups/Latest Wave Backup/"

# Prep work
most_recent_original=$(ls -t "$originals" | head -n1)
source=$originals/$most_recent_original/
me=$(basename $0)
logfile="./logs/$me.$(date +"%Y-%m-%d_%H-%M-%S").log"

# Chatty
echo "Source folder is $source"
echo "Destination foler is $destination"
echo "Log file is $logfile"

if [[ ! -d $destination ]] ; then
    echo 'Destination does not exist, aborting.'
    exit 1
fi

if [[ ! -d $source ]] ; then
    echo 'Source does not exist, aborting.'
    exit 1
fi

# Go
echo 'Here we go...'
rsync -auv --log-file="$logfile" "$source" "$destination"