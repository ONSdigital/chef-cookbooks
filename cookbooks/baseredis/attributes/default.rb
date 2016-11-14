#
# Cookbook Name:: baseredis
# Attributes:: default
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
default['baseredis']['bind']     = '127.0.0.1'

default['baseredis']['packages'] = {
  'rhel' => ['epel-release', 'redis']
}
