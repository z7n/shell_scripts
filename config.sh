# Get distribution
OS_ID=$(grep ^ID= /etc/os-release)
OS_DISTRO=${OS_ID#ID=}
