#
# Cookbook Name:: basepassenger
# Recipe:: install_passenger_ruby_gem
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
VERSION           = node['baseruby']['ruby_version']
INSTALL_DIR       = node['baseruby']['ruby_install_dir']

PASSENGER_VERSION = node['basepassenger']['passenger_version']

GEM_BINARY  = "#{INSTALL_DIR}/bin/gem"
OPTIONS     = "--install-dir #{INSTALL_DIR}/lib/ruby/gems/#{VERSION} --no-document --version #{PASSENGER_VERSION}"

gem_package 'passenger' do
  gem_binary GEM_BINARY
  options    OPTIONS
  action :install
end
