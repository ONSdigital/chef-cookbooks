#
# Cookbook Name:: baseservicemix
# Recipe:: install_hawtio
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
SERVICEMIX_INSTALL_DIR = node['baseservicemix']['servicemix_install_dir']
SERVICEMIX_USER        = node['baseservicemix']['servicemix_user']
HAWTIO_INSTALLED       = node['baseservicemix']['hawtio_installed']
HAWTIO_VERSION         = node['baseservicemix']['hawtio_version']

SERVICEMIX_BIN_DIR     = "#{SERVICEMIX_INSTALL_DIR}/bin"
JAVA_HOME              = '/usr/lib/jvm/jre'

command = "#{SERVICEMIX_BIN_DIR}/client 'feature:repo-add hawtio #{HAWTIO_VERSION}; feature:install hawtio-core'"
execute command do
  user  SERVICEMIX_USER
  group SERVICEMIX_USER
  environment 'JAVA_HOME' => JAVA_HOME
  command command
  action :run
  only_if { HAWTIO_INSTALLED == 'false' }
end

node.set['baseservicemix']['hawtio_installed'] = 'true'
