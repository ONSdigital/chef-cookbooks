#
# Cookbook Name:: basefuse
# Recipe:: create_fuse_control_scripts
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
FUSE_INSTALL_DIR      = node['basefuse']['fuse_install_dir']
FUSE_INSTALL_ROOT     = node['basefuse']['fuse_install_root']
FUSE_USER             = node['basefuse']['fuse_user']

FUSE_BIN_DIR          = "#{FUSE_INSTALL_DIR}/bin"
FUSE_SCRIPTS_DIR      = "#{FUSE_INSTALL_ROOT}/scripts"
FUSE_SCRIPTS_LOGS_DIR = "#{FUSE_INSTALL_ROOT}/scripts/logs"

START_CONTAINERS_FILE = "#{FUSE_SCRIPTS_DIR}/start-all-containers.sh"
STOP_CONTAINERS_FILE  = "#{FUSE_SCRIPTS_DIR}/stop-all-containers.sh"

directory FUSE_SCRIPTS_DIR do
  owner FUSE_USER
  group FUSE_USER
  mode  '0755'
  action :create
end

directory FUSE_SCRIPTS_LOGS_DIR do
  owner FUSE_USER
  group FUSE_USER
  mode  '0755'
  action :create
end

template START_CONTAINERS_FILE do
  source 'start-all-containers.sh.erb'
  owner  FUSE_USER
  group  FUSE_USER
  mode   '0750'
  variables(
    fuse_bin_dir:  FUSE_BIN_DIR
  )
  action :create
  not_if "grep 'Chef' #{START_CONTAINERS_FILE}"
end

template STOP_CONTAINERS_FILE do
  source 'stop-all-containers.sh.erb'
  owner  FUSE_USER
  group  FUSE_USER
  mode   '0750'
  variables(
    fuse_bin_dir:  FUSE_BIN_DIR
  )
  action :create
  not_if "grep 'Chef' #{STOP_CONTAINERS_FILE}"
end
