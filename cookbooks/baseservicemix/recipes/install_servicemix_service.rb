#
# Cookbook Name:: baseservice
# Recipe:: install_servicemix_service
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
SERVICEMIX_INSTALL_DIR = node['baseservicemix']['servicemix_install_dir']

SERVICEMIX_BIN_DIR     = "#{SERVICEMIX_INSTALL_DIR}/bin"
KARAF_SERVICE          = "#{SERVICEMIX_BIN_DIR}/karaf-service"
SYMBOLIC_LINK          = '/etc/init.d/karaf'

link SYMBOLIC_LINK do
  owner 'root'
  group 'root'
  to    KARAF_SERVICE
  notifies :enable, 'service[karaf]', :immediately
  notifies :start,  'service[karaf]', :immediately
  action :create
  not_if { ::File.exist?(SYMBOLIC_LINK) }
end

service 'karaf' do
  supports reload: false, restart: true, status: true
  action :nothing
end
