#
# Cookbook Name:: baseos
# Recipe:: default
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'baseos::update_hosts'
include_recipe 'baseos::update_locale'
include_recipe 'baseos::update_timezone'
include_recipe 'baseos::install_packages'
include_recipe 'chef-client::delete_validation'
