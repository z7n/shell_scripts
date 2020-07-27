#!/bin/bash
if [[ -f /etc/fedora-release ]]; then
  dnf install tmux vim keychain jq fish hub git tig gnome-tweaks gnome-shell-extension-{pomodoro,openweather} buildah podman
fi
if [[ -f /etc/lsb-release ]]; then
  apt install tmux vim keychain jq git tig gnome-tweaks fonts-powerline lxc lxd gnome-shell-pomodoro
fi
