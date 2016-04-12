###############################################################################
# Cookbook Name:: openbazaar
# OpenBazaar Module Definition
# Copyright 2016, Joshua C. Burt
###############################################################################

module OpenBazaar
  module SourceHelper
    def install_source_dependencies
      ###############################################################################
      ## Generic Build Tools
      ###############################################################################
      include_recipe 'build-essential'
      apt_managed_package_list = %w(
          pkg-config
          libtool
      )
      package apt_managed_package_list do
        action :install
      end

      ###############################################################################
      ## OpenSSL
      ###############################################################################
      include_recipe 'openssl::upgrade'
      package %w(libssl-dev) do
        action :install
      end

      ###############################################################################
      ## Special Handling For libsodium-dev
      ###############################################################################
      include_recipe 'libsodium'

      ###############################################################################
      ## Special Handling For libzmq
      # requires libsodium
      ###############################################################################
      include_recipe 'zeromq'

      ###############################################################################
      ## Python Dependencies
      ###############################################################################
      python_runtime '2'
      package %w(python-dev python-pip libffi-dev) do
        action :install
      end
      python_package 'cryptography'

    end

    def sync_source_code

      directory ob_base_dir do
        recursive true
      end

      git ob_server_base_dir do
        repository ob_config['server']['source']
        action :sync
      end

      git ob_client_base_dir do
        repository ob_config['client']['source']
        action :sync
      end
    end
  end
end
