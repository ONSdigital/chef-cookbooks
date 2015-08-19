#
# Cookbook Name:: basefuse
# Recipe:: configure_karaf_config_properties
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
FUSE_INSTALL_DIR = node['basefuse']['fuse_install_dir']
FUSE_USER        = node['basefuse']['fuse_user']
CUSTOM_PACKAGES  = node['basefuse']['custom_packages']

FILE             = "#{FUSE_INSTALL_DIR}/etc/config.properties"

template FILE do
  source 'config.properties.erb'
  owner  FUSE_USER
  group  FUSE_USER
  mode   '0644'
  variables(
    packages: CUSTOM_PACKAGES
  )
  action :create
  not_if "grep 'Chef' #{FILE}"
end
