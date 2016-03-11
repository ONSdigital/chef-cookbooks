#
# Cookbook Name:: baseruby
# Recipe:: install_rubocop
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
VERSION     = node['baseruby']['ruby_version']
INSTALL_DIR = node['baseruby']['ruby_install_dir']

GEM_BINARY  = "#{INSTALL_DIR}/bin/gem"
OPTIONS     = "--install-dir #{INSTALL_DIR}/lib/ruby/gems/#{VERSION} --no-document"

gem_package 'rubocop' do
  gem_binary GEM_BINARY
  options    OPTIONS
  action :install
end