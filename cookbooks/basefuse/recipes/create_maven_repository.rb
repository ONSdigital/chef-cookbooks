#
# Cookbook Name:: basefuse
# Recipe:: create_maven_repository
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
DATA_BAG_NAME        = node['baseos']['credentials_data_bag_name']

MAVEN_REPOSITORY_DIR = node['basefuse']['maven_repository_dir']
FUSE_USER            = node['basefuse']['fuse_user']
FUSE_USER_HOME       = node['basefuse']['fuse_user_home']

MAVEN_SETTINGS_FILE  = "#{MAVEN_REPOSITORY_DIR}/settings.xml"
SYMBOLIC_LINK        = "#{FUSE_USER_HOME}/.m2"

fuse_admin_user     = data_bag_item(DATA_BAG_NAME, 'fuse')['user']
fuse_admin_password = data_bag_item(DATA_BAG_NAME, 'fuse')['password']

directory MAVEN_REPOSITORY_DIR do
  owner FUSE_USER
  group FUSE_USER
  mode  '0750'
  action :create
end

template MAVEN_SETTINGS_FILE do
  source 'settings.xml.erb'
  owner  FUSE_USER
  group  FUSE_USER
  mode   '0640'
  variables(
    admin_user:     fuse_admin_user,
    admin_password: fuse_admin_password
  )
  action :create
  not_if "grep 'Chef' #{MAVEN_SETTINGS_FILE}"
end

if node.chef_environment == 'development'

  # By default Fuse looks for a Maven repository in ~/.m2. We want it to look in
  # the Maven repository we create instead. Creating a symbolic link makes
  # commands such as fabric:watch work properly with our setup.
  link SYMBOLIC_LINK do
    owner FUSE_USER
    group FUSE_USER
    to    MAVEN_REPOSITORY_DIR
    action :create
    not_if { ::File.exist?(SYMBOLIC_LINK) }
  end
end
