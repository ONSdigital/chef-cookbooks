#
# Cookbook Name:: basepassenger
# Attributes:: default
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
default['basepassenger']['passenger_version'] = '5.0.15'
default['basepassenger']['packages'] = {
  'rhel' => ['apr-devel', 'apr-util-devel', 'httpd-devel', 'libcurl-devel']
}
