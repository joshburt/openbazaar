###############################################################################
# Cookbook Name:: openbazaar
# Provider:: installer
# Copyright 2016, Joshua C. Burt
###############################################################################

use_inline_resources

include OpenBazaar::Helper

action :run do
  case node['platform_family']
    when 'debian'
      dpkg_package artifact_name do
        source artifact_cache_path
      end
    else
      log 'the installer does not currently support this os. good luck!'
      log "cached installer may be found here #{artifact_cache_path}"
  end
end