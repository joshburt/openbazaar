###############################################################################
# Cookbook Name:: openbazaar
# Provider:: installer
# Copyright 2016, Joshua C. Burt
###############################################################################

use_inline_resources

include OpenBazaar::ArtifactHelper
include OpenBazaar::ConfigHelper
include OpenBazaar::SourceHelper

action :download do
  if deployment_type == 'source'
    ###########################################################################
    ## Download Dependencies and Source Code
    ###########################################################################

    ## Download/Install dependencies
    install_source_dependencies

    ## Download client and server source
    sync_source_code
  else
    ###########################################################################
    # Download the official installer
    ###########################################################################
    remote_file artifact_cache_path do
      source artifact_source_url
      checksum artifact_checksum
      backup false
      retries 10
      retry_delay 5
      action :create
    end
  end
end

###############################################################################
# Performs the installation
###############################################################################
action :install do
  unless deployment_type == 'source'
    ###########################################################################
    # We don't perform anything if we are a source distribution
    ###########################################################################
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
end

###############################################################################
# Applies our primary configuration to the instance
###############################################################################
action :configure do
  directory ob_server_ssl_dir do
    recursive true
    action :create
  end

  #############################################################################
  # Create our self signed cert for encrypted client connections
  # https://github.com/chef-cookbooks/openssl
  #############################################################################
  openssl_x509 "#{ob_server_ssl_dir}/ob_server_cert.pem" do
    common_name ob_certificate_common_name
    org ob_certificate_org
    org_unit ob_certificate_org_unit
    country ob_certificate_country
  end

  #############################################################################
  # Applies our ob.cfg template
  #############################################################################
  template ob_cfg_path do
    source 'ob.cfg.erb'
    variables(
      CONSTANTS_DATA_FOLDER: ob_server_config_constants_data_folder,
      CONSTANTS_KSIZE: ob_server_config_constants_ksize,
      CONSTANTS_ALPHA: ob_server_config_constants_alpha,
      CONSTANTS_TRANSACTION_FEE: ob_server_config_constants_transaction_fee,
      CONSTANTS_RESOLVER: ob_server_config_constants_resolver,

      LIBBITCOIN_SERVERS_mainnet_server1: ob_server_config_libbitcoin_servers_mainnet_server1,
      LIBBITCOIN_SERVERS_mainnet_server3: ob_server_config_libbitcoin_servers_mainnet_server3,

      LIBBITCOIN_SERVERS_TESTNET_testnet_server2: ob_server_config_libbitcoin_servers_testnet_testnet_server2,
      LIBBITCOIN_SERVERS_TESTNET_testnet_server4: ob_server_config_libbitcoin_servers_testnet_testnet_server4,

      AUTHENTICATION_SSL: ob_server_config_authenication_ssl,
      AUTHENTICATION_SSL_CERT: ob_server_config_authenication_ssl_cert,
      AUTHENTICATION_SSL_KEY: ob_server_config_authenication_ssl_key,
      AUTHENTICATION_USERNAME: ob_server_config_authenication_username,
      AUTHENTICATION_PASSWORD: ob_server_config_authenication_password,

      MAINNET_SEEDS_mainnet_seed2: ob_server_config_mainnet_seeds_mainnet_seed2,
      MAINNET_SEEDS_mainnet_seed3: ob_server_config_mainnet_seeds_mainnet_seed3,

      TESTNET_SEEDS_testnet_seed1: ob_server_config_testnet_seeds_testnet_seed1
    )
  end
end
