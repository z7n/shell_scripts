#!/bin/bash
. config.sh
if [[ $OS_DISTRO == "fedora" ]]; then
  if [[ ! -z $DESKTOP_SESSION ]]; then
    WORKSTATION_PKGS="gnome-tweaks gnome-shell-extension-pomodoro gnome-shell-extension-openweather vinagre \
      papirus-icon-theme"
  fi
  SERVER_PKGS="tmux vim keychain jq git tig buildah podman"
  sudo dnf install -y $WORKSTATION_PKGS $SERVER_PKGS
fi
if [[ $OS_DISTRO == "ubuntu" ]]; then
  if [[ ! -z $DESKTOP_SESSION ]]; then
    DESKTOP_PKGS="gnome-tweaks fonts-powerline gnome-shell-pomodoro"
  fi
  SERVER_PKGS="tmux vim keychain jq git tig lxc lxd"
  sudo apt install -y $DESKTOP_PKGS $SERVER_PKGS
fi
