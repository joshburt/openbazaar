###############################################################################
# Cookbook Name:: openbazaar
# Recipe:: default
# Copyright 2016, Joshua C. Burt
###############################################################################

# Dependency injection ..
Chef::Recipe.send(:include, OpenBazaar::Helper)
Chef::Resource::RemoteFile.send(:include, OpenBazaar::Helper)
Chef::Resource::Package.send(:include, OpenBazaar::Helper)


###############################################################################
# Ensure git is installed..
###############################################################################
include_recipe 'git'

###############################################################################
# Download the offical installer
###############################################################################
remote_file artifact_cache_path do
  source artifact_source_url
  checksum artifact_checksum
  backup false
  retries 10
  retry_delay 5
  action :create
  notifies :install, "dpkg_package[#{artifact_name}]"
end

###############################################################################
# install/upgrade from the artifact
###############################################################################
dpkg_package artifact_name do
  source artifact_cache_path
end