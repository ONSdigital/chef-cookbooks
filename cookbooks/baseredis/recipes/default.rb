#
# Cookbook Name:: baseredis
# Recipe:: default
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'baseos'

include_recipe 'baseredis::update_overcommit_memory'
include_recipe 'baseredis::update_somaxconn'
include_recipe 'baseredis::disable_transparent_huge_pages'
include_recipe 'baseredis::install_packages'
include_recipe 'baseredis::create_redis_config'
include_recipe 'baseredis::install_redis_service'
