#!/bin/bash
#
# Mauricio Buschinelli. Created: July 2023, edited: ?
#
# Setup Syncthing to run at startup as a deamon using systemd
# for a user service (user must first login).

# Taken from official documentation:
# https://docs.syncthing.net/users/autostart.html?highlight=linux%20systemd#linux

# Assumes that:
# - Syncthing was installed using the system's
# package manager (dnf or apt), which will place the required
# systemd files in ~/.config/systemd/user/syncthing.service
# - User "mau" exists

systemctl --user enable syncthing.service
systemctl --user start syncthing.service

echo "Checking Syncthing service status"
systemctl --user status syncthing.service
