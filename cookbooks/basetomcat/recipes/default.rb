#
# Cookbook Name:: basetomcat
# Recipe:: default
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'basejava'

include_recipe 'basetomcat::install_packages'
include_recipe 'basetomcat::update_selinux_policy'
include_recipe 'basetomcat::create_tomcat_server_config'
include_recipe 'basetomcat::create_tomcat_users_config'
include_recipe 'basetomcat::enable_service'
