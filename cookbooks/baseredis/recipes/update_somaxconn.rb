#
# Cookbook Name:: baseredis
# Recipe:: update_somaxconn
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
RC_LOCAL_FILE = '/etc/rc.d/rc.local'

command = 'sysctl -w net.core.somaxconn=65535'
execute command do
  user  'root'
  group 'root'
  command command
  action :run
  not_if "grep 'Chef' #{RC_LOCAL_FILE}"
end
