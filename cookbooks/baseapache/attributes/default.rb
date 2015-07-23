#
# Cookbook Name:: baseapache
# Attributes:: default
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
default['baseapache']['document_root'] = '/var/www/html'
default['baseapache']['packages'] = {
  'rhel' => ['httpd']
}
