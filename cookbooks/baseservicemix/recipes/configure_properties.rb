#
# Cookbook Name:: baseservicemix
# Recipe:: configure_properties
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
FILE_STORE             = 'filestore'
FILE_STORE_PORT        = node['baseos']['filestore']['port']

SERVICEMIX_INSTALL_DIR = node['baseservicemix']['servicemix_install_dir']
SERVICEMIX_USER        = node['baseservicemix']['servicemix_user']

SERVICEMIX_BIN_DIR     = "#{SERVICEMIX_INSTALL_DIR}/bin"
JAVA_HOME              = '/usr/lib/jvm/jre'

COMMAND_SCRIPT         = node['baseservicemix']['command_script']
SCRIPT_NAME            = File.basename(COMMAND_SCRIPT)

remote_file "GET http://#{FILE_STORE}:#{FILE_STORE_PORT}/#{COMMAND_SCRIPT}" do
  source "http://#{FILE_STORE}:#{FILE_STORE_PORT}/#{COMMAND_SCRIPT}"
  path "#{Chef::Config[:file_cache_path]}/#{SCRIPT_NAME}"
  action :create
end

command = "#{SERVICEMIX_BIN_DIR}/client 'shell:source #{Chef::Config[:file_cache_path]}/#{SCRIPT_NAME}'"
execute command do
  user  SERVICEMIX_USER
  group SERVICEMIX_USER
  command command
  environment 'JAVA_HOME' => JAVA_HOME
  action :run
end
