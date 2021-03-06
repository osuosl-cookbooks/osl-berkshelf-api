name             'osl-berkshelf-api'
maintainer       'Oregon State University'
maintainer_email 'systems@osuosl.org'
license          'Apache 2.0'
description      'Installs/Configures osl-berkshelf-api'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends          'berkshelf-api-server'

supports         'centos', '~> 6.0'
