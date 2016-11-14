#
# Cookbook Name:: baseredis
# Recipe:: update_overcommit_memory
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
SYSCTL_CONFIG_FILE = '/etc/sysctl.conf'

command = 'sysctl vm.overcommit_memory=1'
execute command do
  user  'root'
  group 'root'
  command command
  action :run
  not_if "grep 'Chef' #{SYSCTL_CONFIG_FILE}"
end

template SYSCTL_CONFIG_FILE do
  source "#{node['platform_family']}/sysctl.conf.erb"
  owner  'root'
  group  'root'
  mode   '0644'
  action :create
  not_if "grep 'Chef' #{SYSCTL_CONFIG_FILE}"
end
