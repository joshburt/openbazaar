###############################################################################
# Cookbook Name:: openbazaar
# Recipe:: server
# Copyright 2016, Joshua C. Burt
###############################################################################

::Chef::Recipe.send(:include, OpenBazaar::ConfigHelper)
::Chef::Resource::User.send(:include, OpenBazaar::ConfigHelper)
::Chef::Resource::Template.send(:include, OpenBazaar::ConfigHelper)


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
## deploy upstart config
###############################################################################
template '/etc/init/openbazaard.conf' do
  source 'openbazaard.conf.erb'
  variables({
                user: ob_service_account,
                group: ob_service_group,
                chdir: ob_server_base_dir,
                exec: "#{ob_server_base_dir}/openbazaard start --daemon"
            })
  action :create
  notifies :run, 'execute[initctl reload-configuration]'
  only_if {node['platform_family'] == 'debian'}
end

###############################################################################
## for init.d reload if we changed it
###############################################################################
execute 'initctl reload-configuration' do
  action :nothing
end