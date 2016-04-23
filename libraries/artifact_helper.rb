###############################################################################
# Cookbook Name:: openbazaar
# OpenBazaar Module::ArtifactHelper Definition
# Copyright 2016, Joshua C. Burt
###############################################################################

module OpenBazaar
  module ArtifactHelper
    def artifact_cache_path
      ::File.join(Chef::Config['file_cache_path'], artifact_name)
    end

    def artifact_name
      case node['platform_family']
      when 'debian'
        "openbazaar_#{artifact_version}_amd64.deb"
      else
        log 'the installer does not currently support this os. good luck!'
      end

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
      @ob_data ||= get_ob_data
    end

    def get_ob_data
      databag_exists?(node.chef_environment, 'ob') ? data_bag_item(node.chef_environment, 'ob') : nil
    end
  end
end
