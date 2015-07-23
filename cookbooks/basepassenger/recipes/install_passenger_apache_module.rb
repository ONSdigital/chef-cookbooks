#
# Cookbook Name:: basepassenger
# Recipe:: install_passenger_apache_module
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
PASSENGER_VERSION = node['basepassenger']['passenger_version']
RUBY_VERSION      = node['baseruby']['ruby_version']

command = "passenger-install-apache2-module --auto --languages 'ruby'"
execute command do
  user  'root'
  group 'root'
  command command
  action :run
  not_if "test -f /usr/lib/ruby/gems/#{RUBY_VERSION}/gems/passenger-#{PASSENGER_VERSION}/buildout/apache2/mod_passenger.so"
end
