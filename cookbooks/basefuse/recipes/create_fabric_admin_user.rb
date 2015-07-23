#
# Cookbook Name:: basefuse
# Recipe:: create_fabric_admin_user
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
DATA_BAG_NAME     = node['baseos']['credentials_data_bag_name']

FUSE_INSTALL_DIR  = node['basefuse']['fuse_install_dir']
FUSE_USER         = node['basefuse']['fuse_user']

FABRIC_USERS_FILE = "#{FUSE_INSTALL_DIR}/etc/users.properties"

fuse_admin_user     = data_bag_item(DATA_BAG_NAME, 'fuse')['user']
fuse_admin_password = data_bag_item(DATA_BAG_NAME, 'fuse')['password']

template FABRIC_USERS_FILE do
  source 'users.properties.erb'
  owner  FUSE_USER
  group  FUSE_USER
  mode   '0644'
  variables(
    admin_user:     fuse_admin_user,
    admin_password: fuse_admin_password
  )
  action :create
  not_if "grep 'Chef' #{FABRIC_USERS_FILE}"
end
