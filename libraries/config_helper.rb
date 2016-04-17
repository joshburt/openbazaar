###############################################################################
# Cookbook Name:: openbazaar
# OpenBazaar ConfigHelper Module Definition
# Copyright 2016, Joshua C. Burt
###############################################################################

module OpenBazaar
  module ConfigHelper

    def deployment_type
      # default value
      return_value = node['ob']['deployment_type']
      # Then we have some type of structure
      unless ob_config.nil? # protects against non-existant databag
        unless ob_config['deployment_type'].nil? # protected against non-existant data bag items
          return_value = ob_config['deployment_type']
        end
      end
      return_value
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
      # default value
      return_value = node['ob']['server']['ob_service_user']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['ob_service_user'].nil?
            return_value = ob_config['server']['ob_service_user']
          end
        end
      end
      return_value
    end

    def ob_service_group
      # default value
      return_value = node['ob']['server']['ob_service_group']
      # Then we have some type of structure
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['ob_service_group'].nil?
            return_value = ob_config['server']['ob_service_group']
          end
        end
      end
      return_value
   end

    def ob_server_dht_port
      # default value
      return_value = node['ob']['server']['config']['ports']['dht']
      # Then we have some type of structure
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['ports'].nil?
              unless ob_config['server']['config']['ports']['dht'].nil?
                return_value = ob_config['server']['config']['ports']['dht']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_testnet_dht_port
      # default value
      return_value = node['ob']['server']['config']['ports']['testnet_dht']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['ports'].nil?
              unless ob_config['server']['config']['ports']['testnet_dht'].nil?
                return_value = ob_config['server']['config']['ports']['testnet_dht']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_rest_port
      return_value = node['ob']['server']['config']['ports']['rest']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['ports'].nil?
              unless ob_config['server']['config']['ports']['rest'].nil?
                return_value = ob_config['server']['config']['ports']['rest']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_websocket_port
      return_value = node['ob']['server']['config']['ports']['websocket']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['ports'].nil?
              unless ob_config['server']['config']['ports']['websocket'].nil?
                return_value = ob_config['server']['config']['ports']['websocket']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_heartbeat_port
      return_value = node['ob']['server']['config']['ports']['heartbeat']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['ports'].nil?
              unless ob_config['server']['config']['ports']['heartbeat'].nil?
                return_value = ob_config['server']['config']['ports']['heartbeat']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_allowed_admin_ip
      return_value = node['ob']['server']['config']['allowed_admin_ip']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['allowed_admin_ip'].nil?
                return_value = ob_config['server']['config']['allowed_admin_ip']
            end
          end
        end
      end
      return_value
    end

    def ob_server_additional_flags
      return_value = node['ob']['server']['config']['additional_flags']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['additional_flags'].nil?
              return_value = ob_config['server']['config']['additional_flags']
            end
          end
        end
      end
      return_value
    end

    def ob_server_seed_port
      return_value = node['ob']['server']['config']['ports']['seed']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['ports'].nil?
              unless ob_config['server']['config']['ports']['seed'].nil?
                return_value = ob_config['server']['config']['ports']['seed']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_source
      return_value = node['ob']['server']['source']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['source'].nil?
            return_value = ob_config['server']['source']
          end
        end
      end
      return_value
    end

    def ob_server_config_constants_data_folder
      return_value = node['ob']['server']['config']['CONSTANTS']['DATA_FOLDER']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['CONSTANTS'].nil?
              unless ob_config['server']['config']['CONSTANTS']['DATA_FOLDER'].nil?
                return_value = ob_config['server']['config']['CONSTANTS']['DATA_FOLDER']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_config_constants_ksize
      return_value = node['ob']['server']['config']['CONSTANTS']['KSIZE']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['CONSTANTS'].nil?
              unless ob_config['server']['config']['CONSTANTS']['KSIZE'].nil?
                return_value = ob_config['server']['config']['CONSTANTS']['KSIZE']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_config_constants_alpha
      return_value = node['ob']['server']['config']['CONSTANTS']['ALPHA']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['CONSTANTS'].nil?
              unless ob_config['server']['config']['CONSTANTS']['ALPHA'].nil?
                return_value = ob_config['server']['config']['CONSTANTS']['ALPHA']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_config_constants_transaction_fee
      return_value = node['ob']['server']['config']['CONSTANTS']['TRANSACTION_FEE']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['CONSTANTS'].nil?
              unless ob_config['server']['config']['CONSTANTS']['TRANSACTION_FEE'].nil?
                return_value = ob_config['server']['config']['CONSTANTS']['TRANSACTION_FEE']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_config_constants_resolver
      return_value = node['ob']['server']['config']['CONSTANTS']['RESOLVER']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['CONSTANTS'].nil?
              unless ob_config['server']['config']['CONSTANTS']['RESOLVER'].nil?
                return_value = ob_config['server']['config']['CONSTANTS']['RESOLVER']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_config_libbitcoin_servers_mainnet_server1
      return_value = node['ob']['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server1']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['LIBBITCOIN_SERVERS'].nil?
              unless ob_config['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server1'].nil?
                return_value = ob_config['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server1']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_config_libbitcoin_servers_mainnet_server3
      return_value = node['ob']['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server3']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['LIBBITCOIN_SERVERS'].nil?
              unless ob_config['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server3'].nil?
                return_value = ob_config['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server3']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_config_libbitcoin_servers_testnet_testnet_server2
      return_value = node['ob']['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server2']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET'].nil?
              unless ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server2'].nil?
                return_value = ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server2']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_config_libbitcoin_servers_testnet_testnet_server4
      return_value = node['ob']['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server4']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET'].nil?
              unless ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server4'].nil?
                return_value = ob_config['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server4']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_config_authenication_ssl
      return_value = node['ob']['server']['config']['AUTHENTICATION']['SSL']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['AUTHENTICATION'].nil?
              unless ob_config['server']['config']['AUTHENTICATION']['SSL'].nil?
                return_value = ob_config['server']['config']['AUTHENTICATION']['SSL']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_config_authenication_ssl_cert_name
      return_value = node['ob']['server']['config']['AUTHENTICATION']['SSL_CERT']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['AUTHENTICATION'].nil?
              unless ob_config['server']['config']['AUTHENTICATION']['SSL_CERT'].nil?
                return_value = ob_config['server']['config']['AUTHENTICATION']['SSL_CERT']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_config_authenication_ssl_key_name
      return_value = node['ob']['server']['config']['AUTHENTICATION']['SSL_KEY']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['AUTHENTICATION'].nil?
              unless ob_config['server']['config']['AUTHENTICATION']['SSL_KEY'].nil?
                return_value = ob_config['server']['config']['AUTHENTICATION']['SSL_KEY']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_config_authenication_ssl_cert
      "#{ob_server_ssl_dir}/#{ob_server_config_authenication_ssl_cert_name}"
    end

    def ob_server_config_authenication_ssl_key
      "#{ob_server_ssl_dir}/#{ob_server_config_authenication_ssl_key_name}"
    end

    def ob_server_config_authenication_username
      return_value = node['ob']['server']['config']['AUTHENTICATION']['USERNAME']
      unless ob_secrets.nil?
        unless ob_secrets['server'].nil?
          unless ob_secrets['server']['config'].nil?
            unless ob_secrets['server']['config']['AUTHENTICATION'].nil?
              unless ob_secrets['server']['config']['AUTHENTICATION']['USERNAME'].nil?
                return_value = ob_secrets['server']['config']['AUTHENTICATION']['USERNAME']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_config_authenication_password
      return_value = node['ob']['server']['config']['AUTHENTICATION']['PASSWORD']
      unless ob_secrets.nil?
        unless ob_secrets['server'].nil?
          unless ob_secrets['server']['config'].nil?
            unless ob_secrets['server']['config']['AUTHENTICATION'].nil?
              unless ob_secrets['server']['config']['AUTHENTICATION']['PASSWORD'].nil?
                return_value = ob_secrets['server']['config']['AUTHENTICATION']['PASSWORD']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_config_mainnet_seeds_mainnet_seed2
      return_value = node['ob']['server']['config']['MAINNET_SEEDS']['mainnet_seed2']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['MAINNET_SEEDS'].nil?
              unless ob_config['server']['config']['MAINNET_SEEDS']['mainnet_seed2'].nil?
                return_value = ob_config['server']['config']['MAINNET_SEEDS']['mainnet_seed2']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_config_mainnet_seeds_mainnet_seed3
      return_value = node['ob']['server']['config']['MAINNET_SEEDS']['mainnet_seed3']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['MAINNET_SEEDS'].nil?
              unless ob_config['server']['config']['MAINNET_SEEDS']['mainnet_seed3'].nil?
                return_value = ob_config['server']['config']['MAINNET_SEEDS']['mainnet_seed3']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_server_config_testnet_seeds_testnet_seed1
      return_value = node['ob']['server']['config']['TESTNET_SEEDS']['testnet_seed1']
      unless ob_config.nil?
        unless ob_config['server'].nil?
          unless ob_config['server']['config'].nil?
            unless ob_config['server']['config']['TESTNET_SEEDS'].nil?
              unless ob_config['server']['config']['TESTNET_SEEDS']['testnet_seed1'].nil?
                return_value = ob_config['server']['config']['TESTNET_SEEDS']['testnet_seed1']
              end
            end
          end
        end
      end
      return_value
    end

    def ob_certificate_common_name
      return_value = node['ob']['certificate']['common_name']
      unless ob_config.nil?
        unless ob_config['certificate'].nil?
          unless ob_config['certificate']['common_name'].nil?
            return_value = ob_config['certificate']['common_name']
          end
        end
      end
      return_value
    end

    def ob_certificate_org
      return_value = node['ob']['certificate']['org']
      unless ob_config.nil?
        unless ob_config['certificate'].nil?
          unless ob_config['certificate']['org'].nil?
            return_value = ob_config['certificate']['org']
          end
        end
      end
      return_value
    end

    def ob_certificate_org_unit
      return_value = node['ob']['certificate']['org_unit']
      unless ob_config.nil?
        unless ob_config['certificate'].nil?
          unless ob_config['certificate']['org_unit'].nil?
            return_value = ob_config['certificate']['org_unit']
          end
        end
      end
      return_value
    end

    def ob_certificate_country
      return_value = node['ob']['certificate']['country']
      unless ob_config.nil?
        unless ob_config['certificate'].nil?
          unless ob_config['certificate']['country'].nil?
            return_value = ob_config['certificate']['country']
          end
        end
      end
      return_value
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
      if deployment_type == 'binary'
        server_exec = "#{ob_server_base_dir}/openbazaard"
      else
        server_exec = "python #{ob_server_base_dir}/openbazaard.py"
      end
    "#{server_exec}"\
      ' start'\
      ' --daemon'\
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
      #usage:
      #    python httpseed.py <command> [<args>]
      #    python httpseed.py <command> --help
      #
      #commands:
      #    start            start the seed server
      #    stop             shutdown the server and disconnect
      #    restart          restart the server
      #########################################################################
      #usage: usage:
      #    python openbazaard.py start [-d DAEMON]
      #
      #Start the seed server
      #
      #optional arguments:
      #    -h, --help            show this help message and exit
      #    -d, --daemon          run the server in the background
      #    -t, --testnet         use the test network
      #    -p PORT, --port PORT  set the http port
      #########################################################################
      server_exec = "python #{ob_server_base_dir}/httpseed.py"
      "#{server_exec}"\
      ' start'\
      ' --daemon'\
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
      databag_exists?(node.chef_environment, 'ob') ? data_bag_item(node.chef_environment, 'ob') : nil
    end

    def load_ob_secrets
      databag_exists?(node.chef_environment, 'ob_secrets') ? encrypted_data_bag_item(node.chef_environment, 'ob_secrets') : nil
    end

    def databag_exists?(databag_name, databag_item)
      Chef::Log.info "databag_name: #{databag_name} databag_item: #{databag_item}"
      if Chef::DataBag.list.key?(databag_name)
        mybag = Chef::DataBag.load(databag_name)
        myhash = mybag.to_hash
        if myhash[databag_item]
          Chef::Log.info("# found data bag '#{databag_name}'")
          return true
        else
          Chef::Log.info("# '#{databag_name}' not found")
        end
      end
      # return nil, false..
      return false
    end

  end
end
