#
# Cookbook Name:: basethin
# Recipe:: install_thin_service
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
THIN_USER         = node['basethin']['thin_user']
THIN_CONFIG_DIR   = node['basethin']['config_dir']
THIN_SERVICE_FILE = '/usr/lib/systemd/system/thin.service'

directory THIN_CONFIG_DIR do
  owner THIN_USER
  group THIN_USER
  mode  '0755'
  action :create
end

template THIN_SERVICE_FILE do
  source 'thin.service.erb'
  owner  'root'
  group  'root'
  mode   '0644'
  variables(
    thin_config_dir: THIN_CONFIG_DIR,
    thin_user:       THIN_USER
  )
  notifies :enable, 'service[thin]'
  notifies :start,  'service[thin]'
  action :create
  not_if "grep 'Chef' #{THIN_SERVICE_FILE}"
end

service 'thin' do
  supports reload: false, restart: true, status: true
  action :nothing
end
