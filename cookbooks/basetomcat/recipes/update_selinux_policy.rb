#
# Cookbook Name:: basetomcat
# Recipe:: update_selinux_policy
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
CONNECTOR_PORT = node['basetomcat']['connector_port']
PORTS          = [CONNECTOR_PORT]

PORTS.each do |port|
  command = "semanage port --add --type http_port_t --proto tcp #{port}"
  execute command do
    user  'root'
    group 'root'
    command command
    action :run
    not_if "semanage port --list | egrep '^http_port_t' | grep '#{port}'"
  end
end
