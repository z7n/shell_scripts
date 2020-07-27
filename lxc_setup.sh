sudo apt install lxc libpam-cgfs
echo "${USER} veth lxcbr0 10" | sudo tee -a /etc/lxc/lxc-usernet
mkdir -p ${HOME}/.config/lxc/
cp /etc/lxc/default.conf ${HOME}/.config/lxc/default.conf
echo "lxc.id_map = u 0 100000 65536" | tee -a ${HOME}/.config/lxc/default.conf
echo "lxc.id_map = g 0 100000 65536" | tee -a ${HOME}/.config/lxc/default.conf
mkdir -p ${HOME}/.local/share/lxc
chmod +x ${HOME}
chmod +x ${HOME}/.local
chmod +x ${HOME}/.local/share
chmod +x ${HOME}/.local/share/lxc
