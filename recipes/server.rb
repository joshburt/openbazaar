###############################################################################
# Cookbook Name:: openbazaar
# Recipe:: server
# Copyright 2016, Joshua C. Burt
###############################################################################

# Dependency injection..
::Chef::Recipe.send(:include, OpenBazaar::ConfigHelper)
::Chef::Resource::User.send(:include, OpenBazaar::ConfigHelper)
::Chef::Resource::Template.send(:include, OpenBazaar::ConfigHelper)

###############################################################################
## Turn off OpenBazaar Server
###############################################################################
openbazaar_service 'stop openbazaard if running' do
  type 'openbazaard'
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
  type 'openbazaard'
  action :create
end

###############################################################################
## Turn on OpenBazaar Server
###############################################################################
openbazaar_service 'stop openbazaard if stopped' do
  type 'openbazaard'
  action :start
end
