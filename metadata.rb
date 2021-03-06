name             'openbazaar'
maintainer       'Joshua C. Burt'
maintainer_email 'joshburt@shapeandshare.com'
license          'MIT License'
description      'Installs/Configures OpenBazaar Server Components'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.6.0'

issues_url 'https://github.com/joshburt/openbazaar/issues'
source_url 'https://github.com/joshburt/openbazaar'

%w( debian ubuntu ).each do |os|
  supports os
end

depends 'build-essential', '>= 0.0.0'
depends 'chef_handler', '>= 0.0.0'
depends 'chef-sugar', '>= 0.0.0'
depends 'dmg', '>= 0.0.0'
depends 'git', '>= 0.0.0'
depends 'libsodium', '>= 0.0.0'
depends 'openssl', '>= 0.0.0'
depends 'poise', '>= 0.0.0'
depends 'poise-archive', '>= 0.0.0'
depends 'poise-languages', '>= 0.0.0'
depends 'poise-python', '>= 0.0.0'
depends 'seven_zip', '>= 0.0.0'
depends 'windows', '>= 0.0.0'
depends 'yum', '>= 0.0.0'
depends 'yum-epel', '>= 0.0.0'
depends 'zmq', '>= 0.0.0'
