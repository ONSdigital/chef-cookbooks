#
# Cookbook Name:: basepassenger
# Recipe:: create_passenger_apache_module_config
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
PASSENGER_VERSION = node['basepassenger']['passenger_version']
RUBY_VERSION      = node['baseruby']['ruby_version']

FILENAME = '/etc/httpd/conf.modules.d/00-passenger.conf'

template FILENAME do
  source 'passenger.conf.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  variables(
    passenger_version: PASSENGER_VERSION,
    ruby_version:      RUBY_VERSION
  )
  notifies :restart, 'service[httpd]'
  action :create
  not_if "grep 'Chef' #{FILENAME}"
end
