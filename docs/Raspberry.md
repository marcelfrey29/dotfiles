# Raspberry Pi

## Initial Setup (One-Time)

- Install Raspberry Pi OS with `install-raspberry-pi-os.sh`
    - Choose a `username` and `password` for the device
- Boot the Raspberry
- Assign an unique IP to the Raspberry
- Reboot the Raspberry and ensure it receives the correct IP
- Connect to the Raspberry via `ssh <username>@<ip>` and the selected password from above
- Setup SSH Keys for passwordless login with `add-ssh-key-to-remote.sh`
- Connect to the Raspberry via `ssh -i ./remote-machines '<user>@<ip>'`
