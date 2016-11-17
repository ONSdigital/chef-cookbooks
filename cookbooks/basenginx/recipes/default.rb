#
# Cookbook Name:: basenginx
# Recipe:: default
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'baseos'
include_recipe 'basenginx::add_nginx_yum_repository'
include_recipe 'basenginx::install_packages'
include_recipe 'basenginx::install_nginx_service'
