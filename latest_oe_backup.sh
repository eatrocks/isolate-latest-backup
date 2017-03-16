#!/bin/sh
# https://developer.apple.com/legacy/library/documentation/Darwin/Reference/ManPages/man1/rsync.1.html

backups="/Volumes/Orthoease Backups/Orthoease Backup"
most_recent_backup=$(ls -t "$backups" | head -n1)
source=$backups/$most_recent_backup/
echo "Source folder is $source"

destination="/Volumes/Orthoease Backups/Latest Orthoease Backup/"

me=$(basename $0)
logfile="./logs/$me.$(date +"%Y-%m-%d_%H-%M-%S").log"

rsync -auv --log-file="$logfile" "$source" "$destination"