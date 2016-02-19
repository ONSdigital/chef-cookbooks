#
# Cookbook Name:: baseservicemix
# Recipe:: install_web_console_features
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
SERVICEMIX_INSTALL_DIR = node['baseservicemix']['servicemix_install_dir']
SERVICEMIX_USER        = node['baseservicemix']['servicemix_user']

SERVICEMIX_BIN_DIR     = "#{SERVICEMIX_INSTALL_DIR}/bin"
JAVA_HOME              = '/usr/lib/jvm/jre'

command = "#{SERVICEMIX_BIN_DIR}/client 'feature:install webconsole; feature:install activemq-web-console'"
execute command do
  user  SERVICEMIX_USER
  group SERVICEMIX_USER
  environment 'JAVA_HOME' => JAVA_HOME
  command command
  action :run
end
