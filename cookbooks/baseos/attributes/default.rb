#
# Cookbook Name:: baseos
# Attributes:: default
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
default['baseos']['credentials_data_bag_name'] = 'credentials'
default['baseos']['filestore']['port']         = '8001'

default['baseos']['packages'] = {
  'rhel' => ['policycoreutils-python', 'unzip', 'wget', 'zip']
}
