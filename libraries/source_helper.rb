###############################################################################
# Cookbook Name:: openbazaar
# OpenBazaar Module Definition
# Copyright 2016, Joshua C. Burt
###############################################################################

module OpenBazaar
  module SourceHelper
    def install_source_dependencies

      ###############################################################################
      ## Python Dependencies
      ###############################################################################
      python_runtime '2'
      python_package 'cryptography'
      package %w(python-dev python-pip) do
        action :install
      end

      ###############################################################################
      ## Install Distro Managed / OS Level Packages
      ###############################################################################
      include_recipe 'build-essential'

      include_recipe 'openssl::upgrade'
      package %w(libssl-dev) do
        action :install
      end

      apt_managed_package_list = %w(
          libffi-dev
          pkg-config
          libtool
      )
      package apt_managed_package_list do
        action :install
      end

      ###############################################################################
      ## Special Handling For libzmq
      ###############################################################################
      include_recipe 'zeromq'
      package %w(libzmq3-dev) do
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
