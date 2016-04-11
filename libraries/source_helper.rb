###############################################################################
# Cookbook Name:: openbazaar
# OpenBazaar Module Definition
# Copyright 2016, Joshua C. Burt
###############################################################################

module OpenBazaar
  module SourceHelper
    def install_source_dependencies

      include_recipe 'build-essential'

    end

    def sync_source_code

    end
  end
end
