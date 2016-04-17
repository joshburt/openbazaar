###############################################################################
# Cookbook Name:: openbazaar
# Attributes:: default
# Copyright 2016, Joshua C. Burt
###############################################################################

require 'securerandom'

###############################################################################
# Install Type
###############################################################################
default['ob']['deployment_type'] = 'source'

###############################################################################
# Metadata for the binary distribution
###############################################################################
default['ob']['version'] = '1.1.2'
default['ob']['checksum'] = '535e67eadd4e044e7c34c0ce056c244c74d0eb18dd7383c38666c14e6987186d'
default['ob']['source'] = 'https://github.com/OpenBazaar/OpenBazaar-Installer/releases/download/'



###############################################################################
# Client Configuration
###############################################################################
# default['ob']['client']['source'] = 'https://github.com/OpenBazaar/OpenBazaar-Client.git'



###############################################################################
# Server (ob.cfg) Configuration
###############################################################################

# Trusted source
default['ob']['server']['source'] = 'https://github.com/OpenBazaar/OpenBazaar-Server.git'

# [CONSTANTS]
default['ob']['server']['config']['CONSTANTS']['DATA_FOLDER'] = '/home/openbazaar/.openbazaar'
default['ob']['server']['config']['CONSTANTS']['KSIZE'] = 20
default['ob']['server']['config']['CONSTANTS']['ALPHA'] = 3
default['ob']['server']['config']['CONSTANTS']['TRANSACTION_FEE'] = 15000
default['ob']['server']['config']['CONSTANTS']['RESOLVER'] = 'https://resolver.onename.com/'

# [LIBBITCOIN_SERVERS]
default['ob']['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server1'] = 'tcp://libbitcoin1.openbazaar.org:9091'
default['ob']['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server3'] = 'tcp://libbitcoin3.openbazaar.org:9091'

# [LIBBITCOIN_SERVERS_TESTNET]
default['ob']['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server2'] = 'tcp://libbitcoin2.openbazaar.org:9091,baihZB[vT(dcVCwkhYLAzah<t2gJ>{3@k?+>T&^3'
default['ob']['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server4'] = 'tcp://libbitcoin4.openbazaar.org:9091,<Z&{.=LJSPySefIKgCu99w.L%b^6VvuVp0+pbnOM'

# [AUTHENTICATION]
default['ob']['server']['config']['AUTHENTICATION']['SSL'] = 'False'

## The names of the files
default['ob']['server']['config']['AUTHENTICATION']['SSL_CERT'] = 'ob_server_cert.pem'
default['ob']['server']['config']['AUTHENTICATION']['SSL_KEY'] = 'ob_server_cert.key'

## THESE ARE STORED IN AN ENCRYPTED DATA BAG ##
default['ob']['server']['config']['AUTHENTICATION']['USERNAME'] = SecureRandom.hex
default['ob']['server']['config']['AUTHENTICATION']['PASSWORD'] = SecureRandom.hex

# THESE SHOULD BE OVER-RIDDEN!
default['ob']['certificate']['common_name'] = 'www.f00bar.com'
default['ob']['certificate']['org'] = 'Foo Bar'
default['ob']['certificate']['org_unit'] = 'Lab'
default['ob']['certificate']['country'] = 'US'

# [MAINNET_SEEDS]
default['ob']['server']['config']['MAINNET_SEEDS']['mainnet_seed2'] = 'seed2.openbazaar.org:8080,8b17082a57d648894a5181cb6e1b8a6f5b3b7e1c347c0671abfcd7deb6f105fe'
default['ob']['server']['config']['MAINNET_SEEDS']['mainnet_seed3'] = 'seed.obcentral.org:8080,f0ff751b27ddaa86a075aa09785c438cd2cebadb8f0f5a7e16f383911322d4ee'

# [TESTNET_SEEDS]
default['ob']['server']['config']['TESTNET_SEEDS']['testnet_seed1'] = 'seed.openbazaar.org:8080,5b44be5c18ced1bc9400fe5e79c8ab90204f06bebacc04dd9c70a95eaca6e117'

###############################################################################
# Server Service Account Configuration
###############################################################################
default['ob']['server']['ob_service_user'] = 'openbazaar'
default['ob']['server']['ob_service_group'] = 'openbazaar'

###############################################################################
# Server Port and Daemon Configuration Options
###############################################################################
default['ob']['server']['config']['allowed_admin_ip'] = '127.0.0.1'
default['ob']['server']['config']['additional_flags'] = ''
default['ob']['server']['config']['ports']['dht'] = '18467'
default['ob']['server']['config']['ports']['testnet_dht'] = '28467'
default['ob']['server']['config']['ports']['rest'] = '18469'
default['ob']['server']['config']['ports']['websocket'] = '18466'
default['ob']['server']['config']['ports']['heartbeat'] = '18470'
default['ob']['server']['config']['ports']['seed'] = '8080'
