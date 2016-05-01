###############################################################################
# Cookbook Name:: openbazaar
# Resource:: service
# Copyright 2016, Joshua C. Burt
###############################################################################

actions :create, :start, :stop
default_action :create

attribute :type,
          kind_of: String,
          equal_to: %w(openbazaard openbazaarseedd),
          required: true
