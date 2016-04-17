###############################################################################
# Cookbook Name:: openbazaar
# OpenBazaar SourceHelper Module Definition
# Copyright 2016, Joshua C. Burt
###############################################################################

module OpenBazaar
  module SourceHelper
    def install_source_dependencies
      #########################################################################
      ## Generic Build Tools
      #########################################################################
      include_recipe 'build-essential'
      package %w(pkg-config libtool) do
        action :install
      end

      #########################################################################
      ## OpenSSL
      #########################################################################
      include_recipe 'openssl::upgrade'
      package %w(libssl-dev) do
        action :install
      end

      #########################################################################
      ## Special Handling For libsodium-dev
      #########################################################################
      include_recipe 'libsodium'

      #########################################################################
      ## Special Handling For libzmq
      # requires libsodium
      #########################################################################
      include_recipe 'zmq'

      #########################################################################
      ## Python Dependencies
      #########################################################################
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

      #########################################################################
      # Server Source Sync
      #########################################################################
      git ob_server_base_dir do
        repository ob_server_source
        action :sync
      end

      #########################################################################
      # Install pip requirments for the server if need be
      # (cd ./OpenBazaar-Server; pip install -r requirements.txt)
      #########################################################################
      pip_requirements ::File.join(ob_server_base_dir, 'requirements.txt')

      #########################################################################
      ## Copy the 'seed' executable into the runtime location
      #########################################################################
      remote_file ::File.join(ob_server_base_dir, 'httpseed.py') do
        source "file://#{::File.join(ob_server_base_dir, 'seed', 'httpseed.py')}"
        backup false
        action :create
      end
    end
  end
end
