#
# Cookbook Name:: baseruby
# Recipe:: default
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'baseos'

include_recipe 'baseruby::install_development_tools'
include_recipe 'baseruby::install_packages'
include_recipe 'baseruby::install_ruby_build'
include_recipe 'baseruby::install_ruby'
include_recipe 'baseruby::update_ruby_gems_system'
include_recipe 'baseruby::install_bundler'

if node.chef_environment == 'development'
  include_recipe 'baseruby::install_rubocop'
  include_recipe 'baseruby::install_geminabox'
end
