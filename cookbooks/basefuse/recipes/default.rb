#
# Cookbook Name:: basefuse
# Recipe:: default
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'basejava'

include_recipe 'basefuse::create_fuse_user'
include_recipe 'basefuse::create_fuse_group'
include_recipe 'basefuse::unzip_fuse_distro'
include_recipe 'basefuse::configure_karaf_config_properties'
include_recipe 'basefuse::create_maven_repository'
include_recipe 'basefuse::create_fabric_admin_user'
include_recipe 'basefuse::create_fuse_service_wrapper'
include_recipe 'basefuse::install_fuse_service'
include_recipe 'basefuse::update_selinux_policy'
include_recipe 'basefuse::create_fabric'
