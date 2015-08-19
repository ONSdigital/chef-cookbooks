#
# Cookbook Name:: basefuse
# Recipe:: create_fabric
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
FILE_STORE       = 'filestore'
FILE_STORE_PORT  = node['baseos']['filestore']['port']

FUSE_INSTALL_DIR = node['basefuse']['fuse_install_dir']
FUSE_USER        = node['basefuse']['fuse_user']
FUSE_BIN_DIR     = "#{FUSE_INSTALL_DIR}/bin"
JAVA_HOME        = '/usr/lib/jvm/jre'

COMMAND_SCRIPT   = node['basefuse']['fabric']['command_script']
SCRIPT_NAME      = File.basename(COMMAND_SCRIPT)

remote_file "GET http://#{FILE_STORE}:#{FILE_STORE_PORT}/#{COMMAND_SCRIPT}" do
  source "http://#{FILE_STORE}:#{FILE_STORE_PORT}/#{COMMAND_SCRIPT}"
  path "#{Chef::Config[:file_cache_path]}/#{SCRIPT_NAME}"
  action :create
end

command = "#{FUSE_BIN_DIR}/client 'shell:source #{Chef::Config[:file_cache_path]}/#{SCRIPT_NAME}'"
execute command do
  user  FUSE_USER
  group FUSE_USER
  command command
  environment 'JAVA_HOME' => JAVA_HOME
  action :run
  not_if "test -d #{FUSE_INSTALL_DIR}/instances/myLocalBroker1"
end
