###############################################################################
# Cookbook Name:: openbazaar
# OpenBazaar Module Definition
# Copyright 2016, Joshua C. Burt
###############################################################################

module OpenBazaar
  module ConfigHelper

    def deployment_type
      ob_config['deployment_type']
    end

    def ob_base_dir
      case node['platform_family']
        when 'debian'
          '/usr/share/openbazaar'
        else
          log 'the installer does not currently support this os. good luck!'
      end
    end

    def ob_server_base_dir
      if ob_config['deployment_type'] == 'binary'
        "#{ob_base_dir}/resources/OpenBazaar-Server"
      else
        "#{ob_base_dir}/OpenBazaar-Server"
      end

    end

    def ob_service_account
      ob_config['server']['ob_service_user']
    end

    def ob_service_group
      ob_config['server']['ob_service_group']
    end

    def ob_server_dht_port
      ob_config['server']['config']['ports']['dht']
    end

    def ob_server_testnet_dht_port
      ob_config['server']['config']['ports']['testnet_dht']
    end

    def ob_server_rest_port
      ob_config['server']['config']['ports']['rest']
    end

    def ob_server_websocket_port
      ob_config['server']['config']['ports']['websocket']
    end

    def ob_server_heartbeat_port
      ob_config['server']['config']['ports']['heartbeat']
    end

    def ob_server_allowed_admin_ip
      ob_config['server']['config']['allowed_admin_ip']
    end

    def ob_server_additional_flags
      ob_config['server']['config']['additional_flags']
    end

    def ob_client_base_dir
      if deployment_type == 'binary'
        "#{ob_base_dir}/resources/OpenBazaar-Client"
      else
        "#{ob_base_dir}/OpenBazaar-Client"
      end
    end

    def ob_server_daemon_exec_cmd
      if deployment_type == 'binary'
        server_exec = "#{ob_server_base_dir}/openbazaard"
      else
        server_exec = "python #{ob_server_base_dir}/openbazaard.py"
      end
    "#{server_exec}"\
      ' start'\
      ' --daemon'\
      " -p #{ob_server_dht_port}"\
      " -r #{ob_server_rest_port}"\
      " -w #{ob_server_websocket_port}"\
      " -b #{ob_server_heartbeat_port}"\
      " -a #{ob_server_allowed_admin_ip}"\
      " #{ob_server_additional_flags}"
    end

    def ob_server_ssl_dir
      "#{ob_server_base_dir}/ssl"
    end

    def ob_cfg_path
      "#{ob_server_base_dir}/ob.cfg"
    end

    def ob_config
      @ob_config ||= load_ob_config
    end

    def ob_secrets
      @ob_secrets ||= load_ob_secrets
    end

    private
    def load_ob_config
      begin
        data_bag_item(node.chef_environment, 'ob')
      rescue Net::HTTPServerException
        nil
      end
    end

    def load_ob_secrets
      encrypted_data_bag_item(node.chef_environment, 'ob_secrets')
=begin
      begin
        encrypted_data_bag_item(node.chef_environment, 'ob_secrets')
      rescue
        nil
      end
=end
    end
  end
end
