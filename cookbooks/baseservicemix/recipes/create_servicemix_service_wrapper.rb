#
# Cookbook Name:: baseservicemix
# Recipe:: create_servicemix_service_wrapper
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
SERVICEMIX_INSTALL_DIR = node['baseservicemix']['servicemix_install_dir']
SERVICEMIX_USER        = node['baseservicemix']['servicemix_user']

SERVICEMIX_BIN_DIR     = "#{SERVICEMIX_INSTALL_DIR}/bin"
KARAF_SERVICE          = "#{SERVICEMIX_BIN_DIR}/karaf-service"
JAVA_HOME              = '/usr/lib/jvm/jre'

command = "#{SERVICEMIX_BIN_DIR}/start"
execute command do
  user  SERVICEMIX_USER
  group SERVICEMIX_USER
  action :run
  not_if { ::File.exist?(KARAF_SERVICE) }
end

command = "#{SERVICEMIX_BIN_DIR}/client 'feature:install wrapper; wrapper:install --name karaf'"
execute command do
  user  SERVICEMIX_USER
  group SERVICEMIX_USER
  environment 'JAVA_HOME' => JAVA_HOME
  retries     5
  retry_delay 300 # The karaf takes a while to come up
  command command
  action :run
  not_if { ::File.exist?(KARAF_SERVICE) }
end

command = "sed -i 's/#RUN_AS_USER=/RUN_AS_USER=#{SERVICEMIX_USER}/g' #{KARAF_SERVICE}"
execute command do
  user  SERVICEMIX_USER
  group SERVICEMIX_USER
  command command
  notifies :run, 'execute[stop-servicemix-server]'
  action :run
  not_if "grep 'RUN_AS_USER=#{SERVICEMIX_USER}' #{KARAF_SERVICE}"
end

command = "#{SERVICEMIX_BIN_DIR}/stop"
execute 'stop-servicemix-server' do
  user  SERVICEMIX_USER
  group SERVICEMIX_USER
  command command
  action :nothing
end
