#
# Cookbook Name:: baseruby
# Recipe:: install_ruby
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
VERSION     = node['baseruby']['ruby_version']
INSTALL_DIR = node['baseruby']['ruby_install_dir']

command = "/usr/local/bin/ruby-build #{VERSION} #{INSTALL_DIR}"
execute command do
  user  'root'
  group 'root'
  command command
  action :run
  not_if { `ruby --version`.start_with?("ruby #{VERSION}") }
end
