#
# Cookbook Name:: basethin
# Recipe:: default
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'baseruby'
include_recipe 'basethin::install_thin_ruby_gem'
include_recipe 'basethin::create_thin_user'
include_recipe 'basethin::install_thin_service'
