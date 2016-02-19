#
# Cookbook Name:: baseservicemix
# Recipe:: update_servicemix_environment
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
SERVICEMIX_INSTALL_DIR       = node['baseservicemix']['servicemix_install_dir']
SERVICEMIX_USER              = node['baseservicemix']['servicemix_user']

SERVICEMIX_ENVIRONMENT_FILE  = "#{SERVICEMIX_INSTALL_DIR}/bin/setenv"
JAVA_HOME                    = '/usr/lib/jvm/jre'

template SERVICEMIX_ENVIRONMENT_FILE do
  source 'setenv.erb'
  owner  SERVICEMIX_USER
  group  SERVICEMIX_USER
  mode   '0755'
  variables(
    java_home: JAVA_HOME
  )
  action :create
  not_if "grep 'Chef' #{SERVICEMIX_ENVIRONMENT_FILE}"
end
