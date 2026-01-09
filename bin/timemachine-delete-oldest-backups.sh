#!/usr/bin/env bash

# Delete the oldest available TimeMachine backups on a disk.
#
# ./timemachine-delete-oldest-backups.sh <disk> <count_to_delete>
# ./timemachine-delete-oldest-backups.sh /Volumes/TMB-01 3

disk=$1
count=$2

if [[ -z "$1" ]]; then
    echo "Error: No TimeMachine disk defined."
    exit 1
fi

# Make sure the count parameter is a number
if ! [[ "$2" =~ '^[0-9]+$' ]]; then
    echo "Error: No valid count provided."
    exit 1
fi

# List backups, count the lines (backup count) and remove the trailing spaces so 
# that we only have a number as result.
backup_count=$(tmutil listbackups -d $1 | wc -l | tr -d ' ')

# Get the latest backup
newest_backup=$(tmutil latestbackup -d $1)

# Make sure that we keep at least one backup
if [[ $count -ge $backup_count ]]; then 
    echo "Error: The provided count to delete is greather than or equal to the amount of available backups."
    echo "Choose a count which is less than $backup_count."
    exit 1
fi

# Generate the list of backups that should be deleted.
#
# For deletion, the path and the timestamp of the backup are required. While the path
# is provided in "$1", we need to extract the timestamp from the backup list.
# To do so, we first split the string at the "/" character and take the
# 5th element ("2022-02-22-113846.backup"). We than split at the "." character and take
# the first part to get the timestamp. This is repreated for every backup that should 
# be deleted.
# 
# /Volumes/.timemachine/xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx/2022-02-22-113846.backup/2022-02-22-113846.backup
#                                                            2022-02-22-113846.backup
#                                                            2022-02-22-113846
#                                                    
backup_timestamps_to_delete=$(tmutil listbackups -d $1 | head -n$count | xargs -I{} echo {} | cut -d '/' -f 5 | cut -d '.' -f 1)

echo "Following $count backups will be deleted:"
echo $backup_timestamps_to_delete
read "confirmation?Continue? (y/n) "

if ! [[ $confirmation == "y" ]]; then
    echo "Canceled."
    exit 1
fi

# Delete the backups
echo $backup_timestamps_to_delete | xargs -I{} sudo tmutil delete -d $1 -t {}

echo "Deleted $count backups."
