###############################################################################
# Cookbook Name:: openbazaar
# Attributes:: default
# Copyright 2016, Joshua C. Burt
###############################################################################

###############################################################################
# Sane defaults ..
###############################################################################
#default['ob']['deployment_type'] = 'binary'

#default['ob']['version'] = '1.1.2'
#default['ob']['checksum'] = '535e67eadd4e044e7c34c0ce056c244c74d0eb18dd7383c38666c14e6987186d'
#default['ob']['source'] = 'https://github.com/OpenBazaar/OpenBazaar-Installer/releases/download/'

#default['ob']['server']['source'] = 'https://github.com/OpenBazaar/OpenBazaar-Server.git'
#default['ob']['client']['source'] = 'https://github.com/OpenBazaar/OpenBazaar-Client.git'

=begin
###############################################################################
# Defautls for the ob.cfg file
###############################################################################
# [CONSTANTS]
#DATA_FOLDER = /path/to/OpenBazaar/
default['ob']['server']['config']['CONSTANTS']['DATA_FOLDER'] = '/path/to/OpenBazaar/'

# KSIZE = 20
# ALPHA = 3
default['ob']['server']['config']['CONSTANTS']['KSIZE'] = 20
default['ob']['server']['config']['CONSTANTS']['ALPHA'] = 3

# TRANSACTION_FEE = 15000
default['ob']['server']['config']['CONSTANTS']['TRANSACTION_FEE'] = 15000

# RESOLVER = https://resolver.onename.com/
default['ob']['server']['config']['CONSTANTS']['RESOLVER'] = 'https://resolver.onename.com/'

# [LIBBITCOIN_SERVERS]
# mainnet_server1 = tcp://libbitcoin1.openbazaar.org:9091
# mainnet_server3 = tcp://libbitcoin3.openbazaar.org:9091
default['ob']['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server1'] = 'tcp://libbitcoin1.openbazaar.org:9091'
default['ob']['server']['config']['LIBBITCOIN_SERVERS']['mainnet_server3'] = 'tcp://libbitcoin3.openbazaar.org:9091'

# [LIBBITCOIN_SERVERS_TESTNET]
# testnet_server2 = tcp://libbitcoin2.openbazaar.org:9091,baihZB[vT(dcVCwkhYLAzah<t2gJ>{3@k?+>T&^3
# testnet_server4 = tcp://libbitcoin4.openbazaar.org:9091,<Z&{.=LJSPySefIKgCu99w.L%b^6VvuVp0+pbnOM
default['ob']['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server2'] = 'tcp://libbitcoin2.openbazaar.org:9091,baihZB[vT(dcVCwkhYLAzah<t2gJ>{3@k?+>T&^3'
default['ob']['server']['config']['LIBBITCOIN_SERVERS_TESTNET']['testnet_server4'] = 'tcp://libbitcoin4.openbazaar.org:9091,<Z&{.=LJSPySefIKgCu99w.L%b^6VvuVp0+pbnOM'

# [AUTHENTICATION]
# SSL = False
default['ob']['server']['config']['AUTHENTICATION']['SSL'] = 'False'

#SSL_CERT = /path/to/certificate.crt
#SSL_KEY = /path/to/privkey.key
default['ob']['server']['config']['AUTHENTICATION']['SSL_CERT'] = '/path/to/certificate.crt'
default['ob']['server']['config']['AUTHENTICATION']['SSL_KEY'] = '/path/to/privkey.key'

#USERNAME = username
#PASSWORD = password
default['ob']['server']['config']['AUTHENTICATION']['USERNAME'] = 'username'
default['ob']['server']['config']['AUTHENTICATION']['PASSWORD'] = 'password'

# [MAINNET_SEEDS]
# mainnet_seed2 = seed2.openbazaar.org:8080,8b17082a57d648894a5181cb6e1b8a6f5b3b7e1c347c0671abfcd7deb6f105fe
# mainnet_seed3 = seed.obcentral.org:8080,f0ff751b27ddaa86a075aa09785c438cd2cebadb8f0f5a7e16f383911322d4ee
default['ob']['server']['config']['MAINNET_SEEDS']['mainnet_seed2'] = 'seed2.openbazaar.org:8080,8b17082a57d648894a5181cb6e1b8a6f5b3b7e1c347c0671abfcd7deb6f105fe'
default['ob']['server']['config']['MAINNET_SEEDS']['mainnet_seed3'] = 'seed.obcentral.org:8080,f0ff751b27ddaa86a075aa09785c438cd2cebadb8f0f5a7e16f383911322d4ee'

# [TESTNET_SEEDS]
# testnet_seed1 = seed.openbazaar.org:8080,5b44be5c18ced1bc9400fe5e79c8ab90204f06bebacc04dd9c70a95eaca6e117
default['ob']['server']['config']['TESTNET_SEEDS']['testnet_seed1'] = 'seed.openbazaar.org:8080,5b44be5c18ced1bc9400fe5e79c8ab90204f06bebacc04dd9c70a95eaca6e117'

=end
