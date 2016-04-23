###############################################################################
# Cookbook Name:: openbazaar
# OpenBazaar ConfigHelper Module Definition
# Copyright 2016, Joshua C. Burt
###############################################################################

module OpenBazaar
  # helpers for resolving configuration facts
  module ConfigHelper
    def deployment_type
      # Then we have some type of structure
      unless ob_config.nil? # protects against non-existant databag
        unless ob_config['deployment_type'].nil? # protected against non-existant data bag items
          ob_config['deployment_type']
        end
      end
      node['ob']['deployment_type']
    end

    def ob_base_dir
      case node['platform_family']
      when 'debian'
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
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['ob_service_user'].nil?
            ob_config['server']['ob_service_user']
          end
        end
      end
      node['ob']['server']['ob_service_user']
    end

    def ob_service_group
      # Then we have some type of structure
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['ob_service_group'].nil?
            ob_config['server']['ob_service_group']
          end
        end
      end
      node['ob']['server']['ob_service_group']
    end

    def ob_server_dht_port
      # Then we have some type of structure
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['ports'].nil?
              unless ob_config['server']['config']['ports']['dht'].nil?
                ob_config['server']['config']['ports']['dht']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['ports']['dht']
    end

    def ob_server_testnet_dht_port
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['ports'].nil?
              unless ob_config['server']['config']['ports']['testnet_dht'].nil?
                ob_config['server']['config']['ports']['testnet_dht']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['ports']['testnet_dht']
    end

    def ob_server_rest_port
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['ports'].nil?
              unless ob_config['server']['config']['ports']['rest'].nil?
                ob_config['server']['config']['ports']['rest']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['ports']['rest']
    end

    def ob_server_websocket_port
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['ports'].nil?
              unless ob_config['server']['config']['ports']['websocket'].nil?
                ob_config['server']['config']['ports']['websocket']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['ports']['websocket']
    end

    def ob_server_heartbeat_port
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['ports'].nil?
              unless ob_config['server']['config']['ports']['heartbeat'].nil?
                ob_config['server']['config']['ports']['heartbeat']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['ports']['heartbeat']
    end

    def ob_server_allowed_admin_ip
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['allowed_admin_ip'].nil?
              ob_config['server']['config']['allowed_admin_ip']
            end
          end
        end
      end
      node['ob']['server']['config']['allowed_admin_ip']
    end

    def ob_server_additional_flags
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['additional_flags'].nil?
              ob_config['server']['config']['additional_flags']
            end
          end
        end
      end
      node['ob']['server']['config']['additional_flags']
    end

    def ob_server_seed_port
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['ports'].nil?
              unless ob_config['server']['config']['ports']['seed'].nil?
                ob_config['server']['config']['ports']['seed']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['ports']['seed']
    end

    def ob_server_source
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['source'].nil?
            ob_config['server']['source']
          end
        end
      end
      node['ob']['server']['source']
    end

    def ob_server_config_constants_data_folder
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['CONSTANTS'].nil?
              unless ob_config['server']['config']['CONSTANTS']['DATA_FOLDER'].nil?
                ob_config['server']['config']['CONSTANTS']['DATA_FOLDER']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['CONSTANTS']['DATA_FOLDER']
    end

    def ob_server_config_constants_ksize
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['CONSTANTS'].nil?
              unless ob_config['server']['config']['CONSTANTS']['KSIZE'].nil?
                ob_config['server']['config']['CONSTANTS']['KSIZE']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['CONSTANTS']['KSIZE']
    end

    def ob_server_config_constants_alpha
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['CONSTANTS'].nil?
              unless ob_config['server']['config']['CONSTANTS']['ALPHA'].nil?
                ob_config['server']['config']['CONSTANTS']['ALPHA']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['CONSTANTS']['ALPHA']
    end

    def ob_server_config_constants_transaction_fee
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['CONSTANTS'].nil?
              unless ob_config['server']['config']['CONSTANTS']['TRANSACTION_FEE'].nil?
                ob_config['server']['config']['CONSTANTS']['TRANSACTION_FEE']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['CONSTANTS']['TRANSACTION_FEE']
    end

    def ob_server_config_constants_resolver
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['CONSTANTS'].nil?
              unless ob_config['server']['config']['CONSTANTS']['RESOLVER'].nil?
                ob_config['server']['config']['CONSTANTS']['RESOLVER']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['CONSTANTS']['RESOLVER']
    end

    def ob_server_config_libbitcoin_servers_mainnet_server1
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['LIBBITCOIN_SERVERS'].nil?
              unless ob_config['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server1'].nil?
                ob_config['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server1']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server1']
    end

    def ob_server_config_libbitcoin_servers_mainnet_server3
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['LIBBITCOIN_SERVERS'].nil?
              unless ob_config['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server3'].nil?
                ob_config['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server3']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server3']
    end

    def ob_server_config_libbitcoin_servers_testnet_testnet_server2
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET'].nil?
              unless ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server2'].nil?
                ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server2']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server2']
    end

    def ob_server_config_libbitcoin_servers_testnet_testnet_server4
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET'].nil?
              unless ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server4'].nil?
                ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server4']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server4']
    end

    def ob_server_config_authenication_ssl
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['AUTHENTICATION'].nil?
              unless ob_config['server']['config']['AUTHENTICATION']['SSL'].nil?
                ob_config['server']['config']['AUTHENTICATION']['SSL']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['AUTHENTICATION']['SSL']
    end

    def ob_server_config_authenication_ssl_cert_name
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['AUTHENTICATION'].nil?
              unless ob_config['server']['config']['AUTHENTICATION']['SSL_CERT'].nil?
                ob_config['server']['config']['AUTHENTICATION']['SSL_CERT']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['AUTHENTICATION']['SSL_CERT']
    end

    def ob_server_config_authenication_ssl_key_name
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['AUTHENTICATION'].nil?
              unless ob_config['server']['config']['AUTHENTICATION']['SSL_KEY'].nil?
                ob_config['server']['config']['AUTHENTICATION']['SSL_KEY']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['AUTHENTICATION']['SSL_KEY']
    end

    def ob_server_config_authenication_ssl_cert
      "#{ob_server_ssl_dir}/#{ob_server_config_authenication_ssl_cert_name}"
    end

    def ob_server_config_authenication_ssl_key
      "#{ob_server_ssl_dir}/#{ob_server_config_authenication_ssl_key_name}"
    end

    def ob_server_config_authenication_username
      unless ob_secrets.nil?
        unless ob_secrets['server'].nil?
          unless ob_secrets['server']['config'].nil?
            unless ob_secrets['server']['config']['AUTHENTICATION'].nil?
              unless ob_secrets['server']['config']['AUTHENTICATION']['USERNAME'].nil?
                ob_secrets['server']['config']['AUTHENTICATION']['USERNAME']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['AUTHENTICATION']['USERNAME']
    end

    def ob_server_config_authenication_password
      unless ob_secrets.nil?
        unless ob_secrets['server'].nil?
          unless ob_secrets['server']['config'].nil?
            unless ob_secrets['server']['config']['AUTHENTICATION'].nil?
              unless ob_secrets['server']['config']['AUTHENTICATION']['PASSWORD'].nil?
                ob_secrets['server']['config']['AUTHENTICATION']['PASSWORD']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['AUTHENTICATION']['PASSWORD']
    end

    def ob_server_config_mainnet_seeds_mainnet_seed2
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['MAINNET_SEEDS'].nil?
              unless ob_config['server']['config']['MAINNET_SEEDS']['mainnet_seed2'].nil?
                ob_config['server']['config']['MAINNET_SEEDS']['mainnet_seed2']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['MAINNET_SEEDS']['mainnet_seed2']
    end

    def ob_server_config_mainnet_seeds_mainnet_seed3
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['MAINNET_SEEDS'].nil?
              unless ob_config['server']['config']['MAINNET_SEEDS']['mainnet_seed3'].nil?
                ob_config['server']['config']['MAINNET_SEEDS']['mainnet_seed3']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['MAINNET_SEEDS']['mainnet_seed3']
    end

    def ob_server_config_testnet_seeds_testnet_seed1
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['TESTNET_SEEDS'].nil?
              unless ob_config['server']['config']['TESTNET_SEEDS']['testnet_seed1'].nil?
                ob_config['server']['config']['TESTNET_SEEDS']['testnet_seed1']
              end
            end
          end
        end
      end
      node['ob']['server']['config']['TESTNET_SEEDS']['testnet_seed1']
    end

    def ob_certificate_common_name
      unless ob_config.nil?
        unless ob_config['certificate'].nil?
          unless ob_config['certificate']['common_name'].nil?
            ob_config['certificate']['common_name']
          end
        end
      end
      node['ob']['certificate']['common_name']
    end

    def ob_certificate_org
      unless ob_config.nil?
        unless ob_config['certificate'].nil?
          unless ob_config['certificate']['org'].nil?
            ob_config['certificate']['org']
          end
        end
      end
      node['ob']['certificate']['org']
    end

    def ob_certificate_org_unit
      unless ob_config.nil?
        unless ob_config['certificate'].nil?
          unless ob_config['certificate']['org_unit'].nil?
            ob_config['certificate']['org_unit']
          end
        end
      end
      node['ob']['certificate']['org_unit']
    end

    def ob_certificate_country
      unless ob_config.nil?
        unless ob_config['certificate'].nil?
          unless ob_config['certificate']['country'].nil?
            ob_config['certificate']['country']
          end
        end
      end
      node['ob']['certificate']['country']
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
      if Chef::DataBag.list.key?(databag_name)
        mybag = Chef::DataBag.load(databag_name)
        myhash = mybag.to_hash
        true if myhash[databag_item]
      end
      false
    end
  end
end
