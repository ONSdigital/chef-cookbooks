#
# Cookbook Name:: baseservicemix
# Recipe:: create_maven_repository
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
DATA_BAG_NAME        = node['baseos']['credentials_data_bag_name']

MAVEN_REPOSITORY_DIR = node['baseservicemix']['maven_repository_dir']
SERVICEMIX_USER      = node['baseservicemix']['servicemix_user']
SERVICEMIX_USER_HOME = node['baseservicemix']['servicemix_user_home']

MAVEN_SETTINGS_FILE  = "#{MAVEN_REPOSITORY_DIR}/settings.xml"
SYMBOLIC_LINK        = "#{SERVICEMIX_USER_HOME}/.m2"

servicemix_admin_user     = data_bag_item(DATA_BAG_NAME, 'servicemix')['user']
servicemix_admin_password = data_bag_item(DATA_BAG_NAME, 'servicemix')['password']

directory MAVEN_REPOSITORY_DIR do
  owner SERVICEMIX_USER
  group SERVICEMIX_USER
  mode  '0775'
  action :create
end

template MAVEN_SETTINGS_FILE do
  source 'settings.xml.erb'
  owner  SERVICEMIX_USER
  group  SERVICEMIX_USER
  mode   '0640'
  variables(
    admin_user:     servicemix_admin_user,
    admin_password: servicemix_admin_password
  )
  action :create
  not_if "grep 'Chef' #{MAVEN_SETTINGS_FILE}"
end

# To use the local Maven repository in development, the Maven repository
# directory tree needs to be group writable.
if node.chef_environment == 'development'
  command = "setfacl -dm u::rwx,g::rwx,o::rx #{MAVEN_REPOSITORY_DIR}"
  execute command do
    user  'root'
    group 'root'
    command command
    action :run
  end

  # By default ServiceMix looks for a Maven repository in ~/.m2. We want it to
  # look in the Maven repository we create instead.
  link SYMBOLIC_LINK do
    owner SERVICEMIX_USER
    group SERVICEMIX_USER
    to    MAVEN_REPOSITORY_DIR
    action :create
    not_if { ::File.exist?(SYMBOLIC_LINK) }
  end
end
