#
# Cookbook Name:: basepassenger
# Recipe:: default
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'baseruby'
include_recipe 'baseapache'

include_recipe 'basepassenger::create_passenger_user'
include_recipe 'basepassenger::install_packages'
include_recipe 'basepassenger::install_passenger_ruby_gem'
include_recipe 'basepassenger::install_passenger_apache_module'
include_recipe 'basepassenger::create_passenger_apache_module_config'
