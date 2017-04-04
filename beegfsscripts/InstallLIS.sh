#!/bin/bash

set -x
#set -xeuo pipefail

if [[ $(id -u) -ne 0 ]] ; then
    echo "Must be run as root"
    exit 1
fi
wget 'https://download.microsoft.com/download/7/6/B/76BE7A6E-E39F-436C-9353-F4B44EF966E9/lis-rpms-4.1.3-1.tar.gz'
tar xvzf lis-rpms-4.1.3-1.tar.gz
cd LISISO
./install.sh
shutdown -r +1 &
exit 0
