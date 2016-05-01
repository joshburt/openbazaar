###############################################################################
# Cookbook Name:: openbazaar
# OpenBazaar ConfigHelper Module Definition
# Copyright 2016, Joshua C. Burt
###############################################################################

module OpenBazaar
  # helpers for resolving configuration facts
  module ConfigHelper
    def deployment_type
      if ob_config['deployment_type'].nil?
        node['ob']['deployment_type']
      else
        ob_config['deployment_type']
      end
    end

    def ob_base_dir
      case node['platform_family']
      when 'debian'
        '/usr/share/openbazaar'
      when 'rhel'
        '/usr/share/openbazaar'
      else
        log 'the installer does not currently support this os. good luck!'
      end
    end

    def ob_server_base_dir
      if deployment_type == 'binary'
        "#{ob_base_dir}/resources/OpenBazaar-Server"
      else
        "#{ob_base_dir}/OpenBazaar-Server"
      end
    end

    def ob_service_account
      if defined?(ob_config['server']['ob_service_user'])
        ob_config['server']['ob_service_user']
      else
        node['ob']['server']['ob_service_user']
      end
    end

    def ob_service_group
      if defined?(ob_config['server']['ob_service_group'])
        ob_config['server']['ob_service_group']
      else
        node['ob']['server']['ob_service_group']
      end
    end

    def ob_server_dht_port
      if defined?(ob_config['server']['config']['ports']['dht'])
        ob_config['server']['config']['ports']['dht']
      else
        node['ob']['server']['config']['ports']['dht']
      end
    end

    def ob_server_testnet_dht_port
      if defined?(ob_config['server']['config']['ports']['testnet_dht'])
        ob_config['server']['config']['ports']['testnet_dht']
      else
        node['ob']['server']['config']['ports']['testnet_dht']
      end
    end

    def ob_server_rest_port
      if defined?(ob_config['server']['config']['ports']['rest'])
        ob_config['server']['config']['ports']['rest']
      else
        node['ob']['server']['config']['ports']['rest']
      end
    end

    def ob_server_websocket_port
      if defined?(ob_config['server']['config']['ports']['websocket'])
        ob_config['server']['config']['ports']['websocket']
      else
        node['ob']['server']['config']['ports']['websocket']
      end
    end

    def ob_server_heartbeat_port
      if defined?(ob_config['server']['config']['ports']['heartbeat'])
        ob_config['server']['config']['ports']['heartbeat']
      else
        node['ob']['server']['config']['ports']['heartbeat']
      end
    end

    def ob_server_allowed_admin_ip
      if defined?(ob_config['server']['config']['allowed_admin_ip'])
        ob_config['server']['config']['allowed_admin_ip']
      else
        node['ob']['server']['config']['allowed_admin_ip']
      end
    end

    def ob_server_additional_flags
      if defined?(ob_config['server']['config']['additional_flags'])
        ob_config['server']['config']['additional_flags']
      else
        node['ob']['server']['config']['additional_flags']
      end
    end

    def ob_server_seed_port
      if defined?(ob_config['server']['config']['ports']['seed'])
        ob_config['server']['config']['ports']['seed']
      else
        node['ob']['server']['config']['ports']['seed']
      end
    end

    def ob_server_source
      if defined?(ob_config['server']['source'])
        ob_config['server']['source']
      else
        node['ob']['server']['source']
      end
    end

    def ob_server_config_constants_data_folder
      if defined?(ob_config['server']['config']['CONSTANTS']['DATA_FOLDER'])
        ob_config['server']['config']['CONSTANTS']['DATA_FOLDER']
      else
        node['ob']['server']['config']['CONSTANTS']['DATA_FOLDER']
      end
    end

    def ob_server_config_constants_ksize
      if defined?(ob_config['server']['config']['CONSTANTS']['KSIZE'])
        ob_config['server']['config']['CONSTANTS']['KSIZE']
      else
        node['ob']['server']['config']['CONSTANTS']['KSIZE']
      end
    end

    def ob_server_config_constants_alpha
      if defined?(ob_config['server']['config']['CONSTANTS']['ALPHA'])
        ob_config['server']['config']['CONSTANTS']['ALPHA']
      else
        node['ob']['server']['config']['CONSTANTS']['ALPHA']
      end
    end

    def ob_server_config_constants_transaction_fee
      if defined?(ob_config['server']['config']['CONSTANTS']['TRANSACTION_FEE'])
        ob_config['server']['config']['CONSTANTS']['TRANSACTION_FEE']
      else
        node['ob']['server']['config']['CONSTANTS']['TRANSACTION_FEE']
      end
    end

    def ob_server_config_constants_resolver
      if defined?(ob_config['server']['config']['CONSTANTS']['RESOLVER'])
        ob_config['server']['config']['CONSTANTS']['RESOLVER']
      else
        node['ob']['server']['config']['CONSTANTS']['RESOLVER']
      end
    end

    def ob_server_config_libbitcoin_servers_mainnet_server1
      if defined?(ob_config['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server1'])
        ob_config['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server1']
      else
        node['ob']['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server1']
      end
    end

    def ob_server_config_libbitcoin_servers_mainnet_server3
      if defined?(ob_config['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server3'])
        ob_config['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server3']
      else
        node['ob']['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server3']
      end
    end

    def ob_server_config_libbitcoin_servers_testnet_testnet_server2
      if defined?(ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server2'])
        ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server2']
      else
        node['ob']['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server2']
      end
    end

    def ob_server_config_libbitcoin_servers_testnet_testnet_server4
      if defined?(ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server4'])
        ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server4']
      else
        node['ob']['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server4']
      end
    end

    def ob_server_config_authenication_ssl
      if defined?(ob_config['server']['config']['AUTHENTICATION']['SSL'])
        ob_config['server']['config']['AUTHENTICATION']['SSL']
      else
        node['ob']['server']['config']['AUTHENTICATION']['SSL']
      end
    end

    def ob_server_config_authenication_ssl_cert_name
      if defined?(ob_config['server']['config']['AUTHENTICATION']['SSL_CERT'])
        ob_config['server']['config']['AUTHENTICATION']['SSL_CERT']
      else
        node['ob']['server']['config']['AUTHENTICATION']['SSL_CERT']
      end
    end

    def ob_server_config_authenication_ssl_key_name
      if defined?(ob_config['server']['config']['AUTHENTICATION']['SSL_KEY'])
        ob_config['server']['config']['AUTHENTICATION']['SSL_KEY']
      else
        node['ob']['server']['config']['AUTHENTICATION']['SSL_KEY']
      end
    end

    def ob_server_config_authenication_ssl_cert
      "#{ob_server_ssl_dir}/#{ob_server_config_authenication_ssl_cert_name}"
    end

    def ob_server_config_authenication_ssl_key
      "#{ob_server_ssl_dir}/#{ob_server_config_authenication_ssl_key_name}"
    end

    def ob_server_config_authenication_username
      if defined?(ob_secrets['server']['config']['AUTHENTICATION']['USERNAME'])
        ob_secrets['server']['config']['AUTHENTICATION']['USERNAME']
      else
        node['ob']['server']['config']['AUTHENTICATION']['USERNAME']
      end
    end

    def ob_server_config_authenication_password
      if defined?(ob_secrets['server']['config']['AUTHENTICATION']['PASSWORD'])
        ob_secrets['server']['config']['AUTHENTICATION']['PASSWORD']
      else
        node['ob']['server']['config']['AUTHENTICATION']['PASSWORD']
      end
    end

    def ob_server_config_mainnet_seeds_mainnet_seed2
      if defined?(ob_config['server']['config']['MAINNET_SEEDS']['mainnet_seed2'])
        ob_config['server']['config']['MAINNET_SEEDS']['mainnet_seed2']
      else
        node['ob']['server']['config']['MAINNET_SEEDS']['mainnet_seed2']
      end
    end

    def ob_server_config_mainnet_seeds_mainnet_seed3
      if defined?(ob_config['server']['config']['MAINNET_SEEDS']['mainnet_seed3'])
        ob_config['server']['config']['MAINNET_SEEDS']['mainnet_seed3']
      else
        node['ob']['server']['config']['MAINNET_SEEDS']['mainnet_seed3']
      end
    end

    def ob_server_config_testnet_seeds_testnet_seed1
      if defined?(ob_config['server']['config']['TESTNET_SEEDS']['testnet_seed1'])
        ob_config['server']['config']['TESTNET_SEEDS']['testnet_seed1']
      else
        node['ob']['server']['config']['TESTNET_SEEDS']['testnet_seed1']
      end
    end

    def ob_certificate_common_name
      if defined?(ob_config['certificate']['common_name'])
        ob_config['certificate']['common_name']
      else
        node['ob']['certificate']['common_name']
      end
    end

    def ob_certificate_org
      if defined?(ob_config['certificate']['org'])
        ob_config['certificate']['org']
      else
        node['ob']['certificate']['org']
      end
    end

    def ob_certificate_org_unit
      if defined?(ob_config['certificate']['org_unit'])
        ob_config['certificate']['org_unit']
      else
        node['ob']['certificate']['org_unit']
      end
    end

    def ob_certificate_country
      if defined?(ob_config['certificate']['country'])
        ob_config['certificate']['country']
      else
        node['ob']['certificate']['country']
      end
    end

    def ob_client_base_dir
      if deployment_type == 'binary'
        "#{ob_base_dir}/resources/OpenBazaar-Client"
      else
        "#{ob_base_dir}/OpenBazaar-Client"
      end
    end

    def ob_server_daemon_exec_cmd
      #########################################################################
      # usage: python openbazaard.py start [<args>]
      #
      # Start the OpenBazaar server
      #
      # optional arguments:
      # -h, --help            show this help message and exit
      # -d, --daemon          run the server in the background as a daemon
      # -t, --testnet         use the test network
      # -l LOGLEVEL, --loglevel LOGLEVEL
      #      set the logging level [debug, info, warning, error, critical]
      # -p PORT, --port PORT
      #      set the network port
      # -a ALLOWIP, --allowip ALLOWIP
      #      only allow api connections from this ip
      # -r RESTAPIPORT, --restapiport RESTAPIPORT
      #      set the rest api port
      # -w WEBSOCKETPORT, --websocketport WEBSOCKETPORT
      #      set the websocket api port
      # -b HEARTBEATPORT, --heartbeatport HEARTBEATPORT
      #      set the heartbeat port
      # --pidfile PIDFILE     name of the pid file
      #########################################################################
      server_exec = if deployment_type == 'binary'
                      "#{ob_server_base_dir}/openbazaard"
                    else
                      "python #{ob_server_base_dir}/openbazaard.py"
                    end

      "#{server_exec} start --daemon"\
      " --port #{ob_server_dht_port}"\
      " --allowip #{ob_server_allowed_admin_ip}"\
      " --restapiport #{ob_server_rest_port}"\
      " --websocketport #{ob_server_websocket_port}"\
      " --heartbeatport #{ob_server_heartbeat_port}"\
      " #{ob_server_additional_flags}"
    end

    def ob_seed_daemon_exec_cmd
      # ( Seed daemon is only distributed in the source package )
      #########################################################################
      # usage:
      #    python httpseed.py <command> [<args>]
      #    python httpseed.py <command> --help
      #
      # commands:
      #    start            start the seed server
      #    stop             shutdown the server and disconnect
      #    restart          restart the server
      #########################################################################
      # usage: usage:
      #    python openbazaard.py start [-d DAEMON]
      #
      # Start the seed server
      #
      # optional arguments:
      #    -h, --help            show this help message and exit
      #    -d, --daemon          run the server in the background
      #    -t, --testnet         use the test network
      #    -p PORT, --port PORT  set the http port
      #########################################################################
      server_exec = "python #{ob_server_base_dir}/httpseed.py"
      "#{server_exec} start --daemon"\
      " --port #{ob_server_seed_port}"\
      " #{ob_server_additional_flags}"
    end

    def ob_server_ssl_dir
      "#{ob_server_base_dir}/ssl"
    end

    def ob_cfg_path
      "#{ob_server_base_dir}/ob.cfg"
    end

    def ob_config
      @ob_config ||= load_ob_config
    end

    def ob_secrets
      @ob_secrets ||= load_ob_secrets
    end

    private

    def load_ob_config
      databag_exists?(node.chef_environment, 'ob') ? data_bag_item(node.chef_environment, 'ob') : {}
    end

    def load_ob_secrets
      databag_exists?(node.chef_environment, 'ob_secrets') ? encrypted_data_bag_item(node.chef_environment, 'ob_secrets') : {}
    end

    def databag_exists?(databag_name, databag_item)
      return_value = false
      if Chef::DataBag.list.key?(databag_name)
        mybag = Chef::DataBag.load(databag_name)
        myhash = mybag.to_hash
        if myhash[databag_item]
          return_value = true
        end
      end
      return_value
    end
  end
end
