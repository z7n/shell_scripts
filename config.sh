OS_ID=$(grep ^ID= /etc/os-release)
OS_RELEASE=${OS_ID#ID=}
