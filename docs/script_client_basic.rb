#
# Cookbook Name:: openbazaar
# Recipe:: client_basic
#
# Copyright 2016, Joshua C. Burt
#

# OpenBazaar server in one simple script
script 'basic_install_of_openbazaar_client' do
  interpreter "bash"
  code <<-EOH
apt-get install npm -y
apt-get install nodejs -y
git clone https://github.com/OpenBazaar/OpenBazaar-Client.git
cd ./OpenBazaar-Client
npm install
  EOH
end


