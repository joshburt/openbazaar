###############################################################################
# Cookbook Name:: openbazaar
# Provider:: installer
# Copyright 2016, Joshua C. Burt
###############################################################################

use_inline_resources

include OpenBazaar::ArtifactHelper
include OpenBazaar::ConfigHelper

action :install do
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


action :download do
  ###############################################################################
  # Download the offical installer
  ###############################################################################
  remote_file artifact_cache_path do
    source artifact_source_url
    checksum artifact_checksum
    backup false
    retries 10
    retry_delay 5
    action :create
  end
end

###############################################################################
# Applies our primary configuration to the instance
###############################################################################
action :configure do
  ###############################################################################
  # Applies our ob.cfg template
  ###############################################################################
  template ob_cfg_path do
    source 'ob.cfg.erb'
    variables(
        CONSTANTS_DATA_FOLDER: ob_config['server']['config']['CONSTANTS']['DATA_FOLDER'],
        CONSTANTS_KSIZE: ob_config['server']['config']['CONSTANTS']['KSIZE'],
        CONSTANTS_ALPHA: ob_config['server']['config']['CONSTANTS']['ALPHA'],
        CONSTANTS_TRANSACTION_FEE: ob_config['server']['config']['CONSTANTS']['TRANSACTION_FEE'],
        CONSTANTS_RESOLVER: ob_config['server']['config']['CONSTANTS']['RESOLVER'],

        LIBBITCOIN_SERVERS_mainnet_server1: ob_config['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server1'],
        LIBBITCOIN_SERVERS_mainnet_server3: ob_config['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server3'],

        LIBBITCOIN_SERVERS_TESTNET_testnet_server2: ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server2'],
        LIBBITCOIN_SERVERS_TESTNET_testnet_server4: ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server4'],

        AUTHENTICATION_SSL: ob_config['server']['config']['AUTHENTICATION']['SSL'],
        AUTHENTICATION_SSL_CERT: ob_secrets['server']['config']['AUTHENTICATION']['SSL_CERT'],
        AUTHENTICATION_SSL_KEY: ob_secrets['server']['config']['AUTHENTICATION']['SSL_KEY'],
        AUTHENTICATION_USERNAME: ob_secrets['server']['config']['AUTHENTICATION']['USERNAME'],
        AUTHENTICATION_PASSWORD: ob_secrets['server']['config']['AUTHENTICATION']['PASSWORD'],

        MAINNET_SEEDS_mainnet_seed2: ob_config['server']['config']['MAINNET_SEEDS']['mainnet_seed2'],
        MAINNET_SEEDS_mainnet_seed3: ob_config['server']['config']['MAINNET_SEEDS']['mainnet_seed3'],

        TESTNET_SEEDS_testnet_seed1: ob_config['server']['config']['TESTNET_SEEDS']['testnet_seed1']
    )
  end


end
