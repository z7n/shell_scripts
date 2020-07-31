#!/bin/bash
. config.sh
if [[ $OS_DISTRO == "fedora" ]]; then
  sudo dnf install -y lxc lxc-templates
  echo "${USER} veth virbr0 10" | sudo tee -a /etc/lxc/lxc-usernet
  mkdir -p ${HOME}/.config/lxc/
  cp /etc/lxc/default.conf ${HOME}/.config/lxc/default.conf
  sed -i 's/lxcbr/virbr/g' ${HOME}/.config/lxc/default.conf
  echo "lxc.idmap = u 0 100000 65536" | tee -a ${HOME}/.config/lxc/default.conf
  echo "lxc.idmap = g 0 100000 65536" | tee -a ${HOME}/.config/lxc/default.conf
  echo "lxc.init.cmd = /lib/systemd/systemd systemd.unified_cgroup_hierarchy=1" | tee -a ${HOME}/.config/lxc/default.conf
  mkdir -p ${HOME}/.local/share/lxc
  chmod +x ${HOME}
  chmod +x ${HOME}/.local
  chmod +x ${HOME}/.local/share
  chmod +x ${HOME}/.local/share/lxc
fi
if [[ $OS_DISTRO == "ubuntu" ]]; then
  sudo apt install -y lxc libpam-cgfs
  echo "${USER} veth lxcbr0 10" | sudo tee -a /etc/lxc/lxc-usernet
  mkdir -p ${HOME}/.config/lxc/
  cp /etc/lxc/default.conf ${HOME}/.config/lxc/default.conf
  echo "lxc.idmap = u 0 100000 65536" | tee -a ${HOME}/.config/lxc/default.conf
  echo "lxc.idmap = g 0 100000 65536" | tee -a ${HOME}/.config/lxc/default.conf
  mkdir -p ${HOME}/.local/share/lxc
  chmod +x ${HOME}
  chmod +x ${HOME}/.local
  chmod +x ${HOME}/.local/share
  chmod +x ${HOME}/.local/share/lxc
fi
