#
# Cookbook Name:: baseservicemix
# Recipe:: default
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'basejava'

include_recipe 'baseservicemix::create_servicemix_user'
include_recipe 'baseservicemix::create_servicemix_group'
include_recipe 'baseservicemix::unzip_servicemix_distro'
include_recipe 'baseservicemix::update_servicemix_logger'
include_recipe 'baseservicemix::update_servicemix_environment'
include_recipe 'baseservicemix::update_servicemix_activemq_config'
include_recipe 'baseservicemix::create_maven_repository'
include_recipe 'baseservicemix::create_servicemix_service_wrapper'
include_recipe 'baseservicemix::install_servicemix_service'
include_recipe 'baseservicemix::configure_properties'
include_recipe 'baseservicemix::update_selinux_policy'
include_recipe 'baseservicemix::install_hawtio'
