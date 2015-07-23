#
# Cookbook Name:: basepassenger
# Recipe:: install_passenger_ruby_gem
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
VERSION = node['basepassenger']['passenger_version']

gem_package 'passenger' do
  options "--no-document --version #{VERSION}"
  action :install
end
