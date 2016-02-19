#
# Cookbook Name:: baseservicemix
# Recipe:: create_servicemix_user
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
DATA_BAG_NAME          = node['baseos']['credentials_data_bag_name']

SERVICEMIX_INSTALL_DIR = node['baseservicemix']['servicemix_install_dir']
SERVICEMIX_USER        = node['baseservicemix']['servicemix_user']
SERVICEMIX_USER_HOME   = node['baseservicemix']['servicemix_user_home']

SERVICEMIX_BIN_DIR     = "#{SERVICEMIX_INSTALL_DIR}/bin"
PROFILE                = "#{SERVICEMIX_USER_HOME}/.bash_profile"

servicemix_user_password = data_bag_item(DATA_BAG_NAME, 'os')['servicemix_user_password']

shell = node.chef_environment == 'development' ? '/bin/bash' : '/sbin/nologin'
user SERVICEMIX_USER do
  comment  'User account for running Apache ServiceMix'
  home     SERVICEMIX_USER_HOME
  password servicemix_user_password
  shell    shell
  action :create
end

template PROFILE do
  source "#{node['platform_family']}/bash_profile.erb"
  owner  SERVICEMIX_USER
  mode   '0644'
  variables(
    servicemix_bin_dir: SERVICEMIX_BIN_DIR,
    home_dir:           SERVICEMIX_USER_HOME
  )
  action :create
  not_if "grep 'Chef' #{PROFILE}"
end
