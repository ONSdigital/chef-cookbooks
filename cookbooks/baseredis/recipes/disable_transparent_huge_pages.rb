#
# Cookbook Name:: baseredis
# Recipe:: disable_transparent_huge_pages
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
RC_LOCAL_FILE = '/etc/rc.d/rc.local'

command = 'echo never > /sys/kernel/mm/transparent_hugepage/enabled'
execute command do
  user  'root'
  group 'root'
  command command
  action :run
  not_if "grep 'Chef' #{RC_LOCAL_FILE}"
end

template RC_LOCAL_FILE do
  source "#{node['platform_family']}/rc.local.erb"
  owner  'root'
  group  'root'
  mode   '0755'
  action :create
  not_if "grep 'Chef' #{RC_LOCAL_FILE}"
end
