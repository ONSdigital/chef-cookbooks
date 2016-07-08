name             'basepassenger'
maintainer       'ONS'
maintainer_email 'john.topley@ons.gov.uk'
license          'All rights reserved'
description      'Installs/Configures basepassenger'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '1.0.0'

depends          'baseruby'
depends          'baseapache'
supports         'rhel', '>= 7.0'
