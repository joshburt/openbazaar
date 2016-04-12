###############################################################################
# Cookbook Name:: openbazaar
# OpenBazaar Module Definition
# Copyright 2016, Joshua C. Burt
###############################################################################

module OpenBazaar
  module SourceHelper
    def install_source_dependencies

      ###############################################################################
      ## PIP Managed Dependencies
      ###############################################################################
      python_runtime '2'
      python_package 'cryptography'

      ###############################################################################
      ## Install Distro Managed / OS Level Packages
      ###############################################################################
      include_recipe 'build-essential'
      include_recipe 'openssl::upgrade'

      apt_managed_package_list = %w(
          libssl-dev
          libffi-dev
          libzmq3-dev
          pkg-config
          libtool
          python-dev
          python-pip
      )
      package apt_managed_package_list do
        action :install
      end

      ###############################################################################
      ## Special Handling For libsodium-dev
      ###############################################################################





    end

    def sync_source_code

    end
  end
end
