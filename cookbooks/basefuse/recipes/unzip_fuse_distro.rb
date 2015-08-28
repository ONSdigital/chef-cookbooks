#
# Cookbook Name:: basefuse
# Recipe:: unzip_fuse_distro
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
FILE_STORE        = 'filestore'
FILE_STORE_PORT   = node['baseos']['filestore']['port']

FUSE_ARCHIVE      = node['basefuse']['fuse_archive']
FUSE_ARCHIVE_DIR  = node['basefuse']['fuse_archive_dir']
FUSE_INSTALL_ROOT = node['basefuse']['fuse_install_root']
FUSE_INSTALL_DIR  = node['basefuse']['fuse_install_dir']
FUSE_USER         = node['basefuse']['fuse_user']

FUSE_BIN_DIR      = "#{FUSE_INSTALL_DIR}/bin"
KARAF             = "#{FUSE_BIN_DIR}/karaf"

directory FUSE_INSTALL_ROOT do
  owner FUSE_USER
  group FUSE_USER
  mode  '0750'
  action :create
end

remote_file "GET http://#{FILE_STORE}:#{FILE_STORE_PORT}/#{FUSE_ARCHIVE_DIR}/#{FUSE_ARCHIVE}" do
  source "http://#{FILE_STORE}:#{FILE_STORE_PORT}/#{FUSE_ARCHIVE_DIR}/#{FUSE_ARCHIVE}"
  path "/tmp/#{FUSE_ARCHIVE}"
  action :create
end

command = <<-EOC
chown #{FUSE_USER}:#{FUSE_USER} /tmp/#{FUSE_ARCHIVE} &&
chmod 0600 /tmp/#{FUSE_ARCHIVE}
EOC

execute command do
  user    'root'
  group   'root'
  command command
  action :run
  not_if { ::File.exist?(KARAF) }
end

command = "unzip /tmp/#{FUSE_ARCHIVE} -d #{FUSE_INSTALL_ROOT}"
execute command do
  user    FUSE_USER
  group   FUSE_USER
  command command
  action :run
  not_if { ::File.exist?(KARAF) }
end
