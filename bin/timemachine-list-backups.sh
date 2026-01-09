#!/usr/bin/env bash

# List all available TimeMachine backups of a disk.
# 
# ./timemachine-list-backups.sh <disk>
# ./timemachine-list-backups.sh /Volumes/TMB-01 

disk=$1

if [[ -z "$1" ]]; then
    echo "Error: No TimeMachine disk defined."
    exit 1
fi

backup_count=$(tmutil listbackups -d $1 | wc -l | tr -d ' ')
newest_backup=$(tmutil latestbackup -d $1)

echo "There are $backup_count TimeMachine backups on disk $1."
echo "Available Backups:"
tmutil listbackups -d $1
echo " "
echo "The newest backup is $newest_backup"
