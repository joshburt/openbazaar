###############################################################################
# Cookbook Name:: openbazaar
# OpenBazaar Module Definition
# Copyright 2016, Joshua C. Burt
###############################################################################

module OpenBazaar
  module ArtifactHelper
    def artifact_cache_path
      ::File.join(Chef::Config['file_cache_path'], artifact_name)
    end

    def artifact_name
      "openbazaar_#{artifact_version}_amd64.deb"
    end

    def artifact_source_url
      "#{artifact_source_base}v#{artifact_version}/#{artifact_name}"
    end



    def artifact_version
      if ob_data.nil?
        node['ob']['version']
      else
        if ob_data['version'] != '' || ob_data['version'].nil?
          ob_data['version']
        else
          node['ob']['version']
        end
      end

    end

    def artifact_checksum
      if ob_data.nil?
        #ob_data['checksum'].nil? || ob_data['checksum'] == ''
        node['ob']['checksum']
      else
        if ob_data['checksum'] != '' || ob_data['checksum'].nil?
          ob_data['checksum']
        else
          node['ob']['checksum']
        end
      end
    end

    def artifact_source_base
      if ob_data.nil?
        #|| ob_data['source'].nil? || ob_data['source'] == ''
        node['ob']['source']
      else
        if ob_data['source'] != '' || ob_data['source'].nil?
          ob_data['source']
          else
            node['ob']['source']
        end
      end
    end

    private
    def ob_data
      # Chef::Log.info "@ob_data.nil? (#{@ob_data.nil?})"
      @ob_data ||= get_ob_data
    end

    def get_ob_data
      begin
        data_bag_item(node.chef_environment, 'ob')
      rescue Net::HTTPServerException
        nil
      end
    end

  end
  module ConfigHelper
    def ob_base_dir
      case node['platform_family']
        when 'debian'
          '/usr/share/openbazaar'
        else
          log 'the installer does not currently support this os. good luck!'
      end
    end

    def ob_server_base_dir
      "#{ob_base_dir}/resources/OpenBazaar-Server"
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
