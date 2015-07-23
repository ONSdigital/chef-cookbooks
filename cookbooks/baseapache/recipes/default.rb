#
# Cookbook Name:: baseapache
# Recipe:: default
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'baseos'
include_recipe 'baseapache::install_packages'
include_recipe 'baseapache::update_apache_group_membership'
include_recipe 'baseapache::install_apache_service'
