#!/usr/bin/env bash

# Example:
# ./init_backup_directory.sh /Volumes/Backup-04

# Check that a path is given
if [[ -z "$1" ]]; then
    echo "Error: No path defined. Use './init-backup-volume.sh <path>'."
    echo "    Example: ./init-backup-volume.sh /Volumes/Backup-01"
    exit 1
fi

# Ask for confirmation
echo -n "Initialize backup directory in '$1'? (y/n) "
read confirmation
if [[ "$confirmation" = "y" ]]; then
    echo "Initializing Backup directory..."

    # Create Device Directories
    backupRootPath="$1/Devices"
    mkdir -p $backupRootPath
    cd $backupRootPath

    # Save backup root path
    fullBackupRootPath=$(pwd)
    echo "$fullBackupRootPath"

    # List of Devices 
    declare devices=(
        "Marcels-MBP-14"
    )

    # Type of Backup: Encrypted or Decrypted
    declare backupType=(
        "Decrypted"
        "Encrypted"
    )

    # Directories for backups
    declare backupPaths=(
        "Developer"
        "Marcels-Documents"
        "Marcels-Images"
        "Marcels-Music"
        "Marcels-Videos"
        "Marcels-Workspaces"
        "Local"
    )

    # The backup variant for each path (Tool of the Backup)
    declare backupVariants=(
        "By-Date-Backup"
        "Free-File-Sync-Backup"
        "Manual-Backups"
    )

    # Create directories:
    #
    # Example:
    # ==================================================
    #     +- Devices
    #     |    +- Device 1
    #     |    |    +- Strategy 1
    #     |    |    |    +- Path 1
    #     |    |    |    |    +- Variant 1
    #     |    |    |    |    +- Variant 2
    #     |    |    |    +- Path 2
    #     |    |    |         +- Variant 1
    #     |    |    |         +- Variant 2
    #     |    |    +- Strategy 2
    #     |    + Device 2
    # ==================================================
    
    # Device
    for device in "${devices[@]}"; do
        # Type
        for type in "${backupType[@]}"; do
            # Paths
            for backup_path in "${backupPaths[@]}"; do
                # Strategy
                for variant in "${backupVariants[@]}"; do
                    mkdir -p "$fullBackupRootPath/$device/$type/$backup_path/$variant";
                done
            done
        done
    done

    echo "Done."
else
    echo "Cancelled."
    exit 1
fi
