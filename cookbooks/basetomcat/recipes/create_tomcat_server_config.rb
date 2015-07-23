#
# Cookbook Name:: basetomcat
# Recipe:: create_tomcat_server_config
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
CONNECTOR_PORT = node['basetomcat']['connector_port']
CONFIG_FILE    = '/etc/tomcat/server.xml'

template CONFIG_FILE do
  source 'server.xml.erb'
  owner  'tomcat'
  group  'tomcat'
  mode   '0660'
  variables(
    connector_port: CONNECTOR_PORT
  )
  action :create
  not_if "grep 'Chef' #{CONFIG_FILE}"
end
