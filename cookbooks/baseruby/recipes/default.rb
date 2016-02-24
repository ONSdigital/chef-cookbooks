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
include_recipe 'baseruby::install_rubocop' if node.chef_environment == 'development'
