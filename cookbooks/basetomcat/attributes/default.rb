#
# Cookbook Name:: basetomcat
# Attributes:: default
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
default['basetomcat']['connector_port'] = '8180'

default['basetomcat']['packages'] = {
  'rhel' => ['epel-release', 'tomcat', 'tomcat-admin-webapps']
}
