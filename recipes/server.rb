###############################################################################
# Cookbook Name:: openbazaar
# Recipe:: server
# Copyright 2016, Joshua C. Burt
###############################################################################

###############################################################################
# the environment needs to be sane
###############################################################################
include_recipe 'openbazaar'

###############################################################################
## Create service account
###############################################################################
user 'openbazaar' do
  #comment 'openbazaar daemon'
  #system true
  manage_home true
  system true
  home '/home/openbazaar'
  shell '/bin/bash'
  action :create
end

###############################################################################
## create init.d wrapper
###############################################################################
cookbook_file '/etc/init/openbazaard.conf' do
  source 'openbazaard.conf'
  action :create
  notifies :run, 'execute[initctl reload-configuration]'
end

###############################################################################
## for init.d reload if we changed it
###############################################################################
execute 'initctl reload-configuration' do
  action :nothing
end