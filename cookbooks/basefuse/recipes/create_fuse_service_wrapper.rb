#
# Cookbook Name:: basefuse
# Recipe:: create_fuse_service_wrapper
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
FUSE_INSTALL_DIR = node['basefuse']['fuse_install_dir']
FUSE_USER        = node['basefuse']['fuse_user']

FUSE_BIN_DIR     = "#{FUSE_INSTALL_DIR}/bin"
KARAF_SERVICE    = "#{FUSE_BIN_DIR}/karaf-service"
JAVA_HOME        = '/usr/lib/jvm/jre'

command = "#{FUSE_BIN_DIR}/start"
execute command do
  user  FUSE_USER
  group FUSE_USER
  action :run
  not_if { ::File.exist?(KARAF_SERVICE) }
end

command = "#{FUSE_BIN_DIR}/client 'features:install wrapper; wrapper:install -n karaf'"
execute command do
  user  FUSE_USER
  group FUSE_USER
  environment 'JAVA_HOME' => JAVA_HOME
  retries     5
  retry_delay 300 # The karaf takes a while to come up
  command command
  action :run
  not_if { ::File.exist?(KARAF_SERVICE) }
end

command = "sed -i 's/#RUN_AS_USER=/RUN_AS_USER=#{FUSE_USER}/g' #{KARAF_SERVICE}"
execute command do
  user  FUSE_USER
  group FUSE_USER
  command command
  notifies :run, 'execute[stop-fuse-server]'
  action :run
  not_if "grep 'RUN_AS_USER=#{FUSE_USER}' #{KARAF_SERVICE}"
end

command = "#{FUSE_BIN_DIR}/stop"
execute 'stop-fuse-server' do
  user  FUSE_USER
  group FUSE_USER
  command command
  action :nothing
end
