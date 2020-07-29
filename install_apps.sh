#!/bin/bash
. config.sh
if [[ $OS_RELEASE == "fedora" ]]; then
  dnf install tmux vim keychain jq git tig gnome-tweaks gnome-shell-extension-{pomodoro,openweather} buildah podman
fi
if [[ $OS_RELEASE == "ubuntu" ]]; then
  apt install tmux vim keychain jq git tig gnome-tweaks fonts-powerline lxc lxd gnome-shell-pomodoro
fi
