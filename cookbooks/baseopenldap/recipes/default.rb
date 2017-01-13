#
# Cookbook Name:: baseopenldap
# Recipe:: default
#
# Copyright 2017, ONS
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'baseos'
include_recipe 'baseopenldap::install_packages'
include_recipe 'baseopenldap::install_openldap_service'
