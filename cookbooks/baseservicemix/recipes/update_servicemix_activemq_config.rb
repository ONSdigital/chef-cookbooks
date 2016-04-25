#
# Cookbook Name:: baseservicemix
# Recipe:: update_servicemix_activemq_config
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
SERVICEMIX_INSTALL_DIR = node['baseservicemix']['servicemix_install_dir']
SERVICEMIX_USER        = node['baseservicemix']['servicemix_user']
OPENWIRE_PORT          = node['baseservicemix']['openwire_port']

ACTIVE_MQ_CONFIG_FILE  = "#{SERVICEMIX_INSTALL_DIR}/etc/activemq.xml"
SYSTEM_PROPERTIES_FILE = "#{SERVICEMIX_INSTALL_DIR}/etc/system.properties"

template ACTIVE_MQ_CONFIG_FILE do
  source 'activemq.xml.erb'
  owner  SERVICEMIX_USER
  group  SERVICEMIX_USER
  mode   '0644'
  variables(
    openwire_port: OPENWIRE_PORT
  )
  action :create
  not_if "grep 'Chef' #{ACTIVE_MQ_CONFIG_FILE}"
end

template SYSTEM_PROPERTIES_FILE do
  source 'system.properties.erb'
  owner  SERVICEMIX_USER
  group  SERVICEMIX_USER
  mode   '0644'
  variables(
    openwire_port: OPENWIRE_PORT
  )
  action :create
  not_if "grep 'Chef' #{SYSTEM_PROPERTIES_FILE}"
end
