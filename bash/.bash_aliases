#!/bin/bash
#
# ====== Mauricio Buschinelli, June 2023 =====
#
# Inteded for 'apt' Linux distributions to load bash configuration files from ~/.bashrc.d/*
# in order to be consistent with Fedora
#
# =====

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
