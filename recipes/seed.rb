###############################################################################
# Cookbook Name:: openbazaar
# Recipe:: seed
# Copyright 2016, Joshua C. Burt
###############################################################################

# Dependency injection..
::Chef::Recipe.send(:include, OpenBazaar::ConfigHelper)
::Chef::Resource::User.send(:include, OpenBazaar::ConfigHelper)
::Chef::Resource::Template.send(:include, OpenBazaar::ConfigHelper)

###############################################################################
## Turn off openbazaarseedd Server
###############################################################################
openbazaar_service 'stop openbazaarseedd if running' do
  type 'openbazaarseedd'
  action :stop
end

###############################################################################
# the environment needs to be sane
###############################################################################
include_recipe 'openbazaar'

###############################################################################
## Create service account
###############################################################################
user ob_service_account do
  manage_home true
  system true
  home "/home/#{ob_service_account}"
  shell '/bin/bash'
  action :create
end

###############################################################################
## register as a system service for auto start up
###############################################################################
openbazaar_service 'register as a service' do
  type 'openbazaarseedd'
  action :create
end

###############################################################################
## Turn on openbazaarseedd Server
###############################################################################
openbazaar_service 'start openbazaarseedd if stopped' do
  type 'openbazaarseedd'
  action :start
end
