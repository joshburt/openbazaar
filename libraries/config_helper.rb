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

    def ob_client_base_dir
      if deployment_type == 'binary'
        "#{ob_base_dir}/resources/OpenBazaar-Client"
      else
        "#{ob_base_dir}/OpenBazaar-Client"
      end
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
