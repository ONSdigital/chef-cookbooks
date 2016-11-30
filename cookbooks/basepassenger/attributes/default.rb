#
# Cookbook Name:: basepassenger
# Attributes:: default
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
default['basepassenger']['passenger_user']      = 'passenger'
default['basepassenger']['passenger_user_home'] = '/home/passenger'
default['basepassenger']['passenger_version']   = '5.0.30'

default['basepassenger']['packages'] = {
  'rhel' => ['apr-devel', 'apr-util-devel', 'httpd-devel', 'libcurl-devel']
}
