###############################################################################
# Cookbook Name:: openbazaar
# OpenBazaar Module::ArtifactHelper Definition
# Copyright 2016, Joshua C. Burt
###############################################################################

module OpenBazaar
  # helpers for resolving artifact facts
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
      node['ob']['version'] if ob_data.nil?
      ob_data['version'] if ob_data['version'] != '' || ob_data['version'].nil?
      node['ob']['version']
    end

    def artifact_checksum
      node['ob']['checksum'] if ob_data.nil?
      ob_data['checksum'] if ob_data['checksum'] != '' || ob_data['checksum'].nil?
      node['ob']['checksum']
    end

    def artifact_source_base
      node['ob']['source'] if ob_data.nil?
      ob_data['source'] if ob_data['source'] != '' || ob_data['source'].nil?
      node['ob']['source']
    end

    private

    def ob_data
      @ob_data ||= load_ob_data
    end

    def load_ob_data
      databag_exists?(node.chef_environment, 'ob') ? data_bag_item(node.chef_environment, 'ob') : {}
    end
  end
end
