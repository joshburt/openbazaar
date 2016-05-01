###############################################################################
# Cookbook Name:: openbazaar
# Provider:: service
# Copyright 2016, Joshua C. Burt
###############################################################################

use_inline_resources

include OpenBazaar::ConfigHelper

action :create do
  case node['platform']
  when 'ubuntu'
    if node['platform_version'].to_f <= 14.04
      ###############################################################################
      ## deploy upstart config
      ###############################################################################
      template "/etc/init/#{new_resource.type}.conf" do
        source "#{new_resource.type}.upstart.conf.erb"
        variables(
          user: ob_service_account,
          group: ob_service_group,
          chdir: ob_server_base_dir,
          exec: if new_resource.type == 'openbazaard'
                  ob_server_daemon_exec_cmd
                elsif new_resource.type == 'openbazaarseedd'
                  ob_seed_daemon_exec_cmd
                end
        )
        action :create
        notifies :run, 'execute[initctl reload-configuration]'
      end

      ###############################################################################
      ## for init.d reload if we changed it
      ###############################################################################
      execute 'initctl reload-configuration' do
        action :nothing
      end
    end
  end
end

action :start do
  case node['platform']
  when 'ubuntu'
    ###############################################################################
    ## Turn on service
    ###############################################################################
    service new_resource.type do
      provider Chef::Provider::Service::Upstart
      action :start
      only_if { node['platform_version'].to_f <= 14.04 }
    end
  end
end

action :stop do
  case node['platform']
  when 'ubuntu'
    ###############################################################################
    ## Turn off service
    ###############################################################################
    service new_resource.type do
      provider Chef::Provider::Service::Upstart
      action :stop
      only_if { node['platform_version'].to_f <= 14.04 }
    end
  end
end
