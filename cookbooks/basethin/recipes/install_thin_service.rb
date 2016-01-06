#
# Cookbook Name:: basethin
# Recipe:: install_thin_service
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
RUBY_INSTALL_DIR = node['baseruby']['ruby_install_dir']

THIN_USER        = node['basethin']['thin_user']
THIN_CONFIG_DIR  = node['basethin']['config_dir']
THIN_INIT_FILE   = '/etc/init.d/thin'

directory THIN_CONFIG_DIR do
  owner THIN_USER
  group THIN_USER
  mode  '0755'
  action :create
end

template THIN_INIT_FILE do
  source 'thin_init.erb'
  owner  'root'
  group  'root'
  mode   '0755'
  variables(
    ruby_install_dir: RUBY_INSTALL_DIR,
    thin_user:        THIN_USER
  )
  notifies :enable, 'service[thin]'
  notifies :start,  'service[thin]'
  action :create
  not_if "grep 'Chef' #{THIN_INIT_FILE}"
end

service 'thin' do
  supports reload: false, restart: true, status: false
  action :nothing
end
