name             'openbazaar'
maintainer       'Joshua C. Burt'
maintainer_email 'joshburt@shapeandshare.com'
license          'MIT License'
description      'Installs/Configures openbazaar'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends 'git', '~> 4.0'
depends 'openssl'
depends 'chef-sugar'
depends 'build-essential'
depends 'poise-python'
