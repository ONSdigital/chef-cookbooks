#
# Cookbook Name:: basefuse
# Recipe:: install_fuse_service
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
FUSE_INSTALL_DIR = node['basefuse']['fuse_install_dir']

FUSE_BIN_DIR     = "#{FUSE_INSTALL_DIR}/bin"
KARAF_SERVICE    = "#{FUSE_BIN_DIR}/karaf-service"
SYMBOLIC_LINK    = '/etc/init.d/karaf'

link "#{SYMBOLIC_LINK}" do
  owner 'root'
  group 'root'
  to    "#{KARAF_SERVICE}"
  notifies :enable, 'service[karaf]', :immediately
  notifies :start,  'service[karaf]', :immediately
  action :create
  not_if "test -f #{SYMBOLIC_LINK}"
end

service 'karaf' do
  supports reload: false, restart: true, status: true
  action :nothing
end
