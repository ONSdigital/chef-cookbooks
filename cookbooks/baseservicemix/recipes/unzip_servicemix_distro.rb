#
# Cookbook Name:: baseservicemix
# Recipe:: unzip_servicemix_distro
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
FILE_STORE        = 'filestore'
FILE_STORE_PORT   = node['baseos']['filestore']['port']

SERVICEMIX_ARCHIVE      = node['baseservicemix']['servicemix_archive']
SERVICEMIX_ARCHIVE_DIR  = node['baseservicemix']['servicemix_archive_dir']
SERVICEMIX_INSTALL_ROOT = node['baseservicemix']['servicemix_install_root']
SERVICEMIX_INSTALL_DIR  = node['baseservicemix']['service_install_dir']
SERVICEMIX_USER         = node['baseservicemix']['servicemix_user']

SERVICEMIX_BIN_DIR      = "#{SERVICEMIX_INSTALL_DIR}/bin"
KARAF                   = "#{SERVICEMIX_BIN_DIR}/karaf"

directory SERVICEMIX_INSTALL_ROOT do
  owner SERVICEMIX_USER
  group SERVICEMIX_USER
  mode  '0775'
  action :create
end

remote_file "GET http://#{FILE_STORE}:#{FILE_STORE_PORT}/#{SERVICEMIX_ARCHIVE_DIR}/#{SERVICEMIX_ARCHIVE}" do
  source "http://#{FILE_STORE}:#{FILE_STORE_PORT}/#{SERVICEMIX_ARCHIVE_DIR}/#{SERVICEMIX_ARCHIVE}"
  path "/tmp/#{SERVICEMIX_ARCHIVE}"
  action :create
end

command = <<-EOC
chown #{SERVICEMIX_USER}:#{SERVICEMIX_USER} /tmp/#{SERVICEMIX_ARCHIVE} &&
chmod 0600 /tmp/#{SERVICEMIX_ARCHIVE}
EOC

execute command do
  user    'root'
  group   'root'
  command command
  action :run
  not_if { ::File.exist?(KARAF) }
end

command = "unzip -n /tmp/#{SERVICEMIX_ARCHIVE} -d #{SERVICEMIX_INSTALL_ROOT}"
execute command do
  user    SERVICEMIX_USER
  group   SERVICEMIX_USER
  command command
  action :run
  not_if { ::File.exist?(KARAF) }
end
