name             'basepostgresql'
maintainer       'ONS'
maintainer_email 'john.topley@ons.gov.uk'
license          'All rights reserved'
description      'Installs/Configures basepostgresql'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'

depends          'baseos'
depends          'postgresql'
supports         'rhel', '>= 7.0'
