name             'openbazaar'
maintainer       'Joshua C. Burt'
maintainer_email 'joshburt@shapeandshare.com'
license          'MIT License'
description      'Installs/Configures openbazaar'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.3.4'

issues_url 'https://github.com/joshburt/openbazaar/issues'
source_url 'https://github.com/joshburt/openbazaar'

supports 'ubuntu'

depends 'git', '~> 4.0'
depends 'openssl'
depends 'chef-sugar'
depends 'build-essential'
depends 'poise-python'
depends 'zmq'
depends 'libsodium'
