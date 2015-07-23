name             'baseos'
maintainer       'ONS'
maintainer_email 'john.topley@ons.gov.uk'
license          'All rights reserved'
description      'Installs/Configures baseos'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends          'chef-client'
depends          'hostname'
supports         'rhel', '>= 7.0'
