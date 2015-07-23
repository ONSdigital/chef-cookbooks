#
# Cookbook Name:: baseos
# Recipe:: update_hosts
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
FILE_STORE = node['baseos']['filestore']['host']
HOSTS_FILE = '/etc/hosts'

template HOSTS_FILE do
  source "#{node['platform_family']}/hosts.erb"
  owner  'root'
  group  'root'
  mode   '0644'
  variables(
    filestore: FILE_STORE,
    ipaddress: node[:ipaddress],
    hostname:  node[:hostname],
    fqdn:      `hostname` # Using `hostname` seems to work more reliably than node[:fqdn] for some reason.
  )
  action :create
  not_if "grep 'Chef' #{HOSTS_FILE}"
end
