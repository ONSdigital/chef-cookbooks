#
# Cookbook Name:: basefuse
# Recipe:: create_fuse_user
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
DATA_BAG_NAME    = node['baseos']['credentials_data_bag_name']

FUSE_INSTALL_DIR = node['basefuse']['fuse_install_dir']
FUSE_USER        = node['basefuse']['fuse_user']
FUSE_USER_HOME   = node['basefuse']['fuse_user_home']
PROCESS_LIMIT    = node['basefuse']['fuse_user_process_limit']

FUSE_BIN_DIR     = "#{FUSE_INSTALL_DIR}/bin"
PROFILE          = node['platform_family'] == 'debian' ? "#{FUSE_USER_HOME}/.profile" : "#{FUSE_USER_HOME}/.bash_profile"

fuse_user_password = data_bag_item(DATA_BAG_NAME, 'os')['fuse_user_password']

shell = node.chef_environment == 'development' ? '/bin/bash' : '/sbin/nologin'
user FUSE_USER do
  comment  'User account for running JBoss Fuse ESB'
  home     FUSE_USER_HOME
  password fuse_user_password
  shell    shell
  action :create
end

template PROFILE do
  source "#{node['platform_family']}/bash_profile.erb"
  owner  FUSE_USER
  mode   '0644'
  variables(
    fuse_bin_dir:  FUSE_BIN_DIR,
    home_dir:      FUSE_USER_HOME,
    process_limit: PROCESS_LIMIT
  )
  action :create
  not_if "grep 'Chef' #{PROFILE}"
end
