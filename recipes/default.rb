###############################################################################
# Cookbook Name:: openbazaar
# Recipe:: default
# Copyright 2016, Joshua C. Burt
###############################################################################

###############################################################################
# ensure chef-sugar is in the run list, explicitly calling it out here
# allows the consumer to NOT need to include it in the runlist (roles, etc)
###############################################################################
include_recipe 'chef-sugar'

###############################################################################
# Ensure git is installed..
###############################################################################
include_recipe 'git'

###############################################################################
# Download the official installer, or source and dependencies as commanded
###############################################################################
openbazaar_installer 'download' do
  action :download
  notifies :install, 'openbazaar_installer[install]', :immediately
end

###############################################################################
# install/upgrade from the binary artifact
###############################################################################
openbazaar_installer 'install' do
  action :nothing
end

###############################################################################
# configure the local installation
###############################################################################
openbazaar_installer 'configure' do
  action :configure
end
