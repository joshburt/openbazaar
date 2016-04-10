#
# Cookbook Name:: openbazaar
# Recipe:: server_basic
#
# Copyright 2016, Joshua C. Burt
#

# OpenBazaar server in one simple script
script 'basic_install_of_openbazaar_server' do
  interpreter "bash"
  code <<-EOH
apt-get update -y
apt-get upgrade -y
apt-get install git -y
apt-get install build-essential libssl-dev libffi-dev python-dev openssl python-pip libzmq3-dev -y
echo "deb http://us.archive.ubuntu.com/ubuntu trusty main universe" | tee -a /etc/apt/sources.list
apt-get update -y
apt-get -f install -y
apt-get install libsodium-dev -y
pip install cryptography
apt-get install autoconf pkg-config libtool -y
git clone https://github.com/zeromq/libzmq
(cd ./libzmq; ./autogen.sh && ./configure && make -j 4)
(cd ./libzmq; make check && make install && ldconfig)
git clone https://github.com/OpenBazaar/OpenBazaar-Server.git
(cd ./OpenBazaar-Server; pip install -r requirements.txt)
  EOH
end


