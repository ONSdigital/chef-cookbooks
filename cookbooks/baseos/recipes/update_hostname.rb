#
# Cookbook Name:: baseos
# Recipe:: update_hostname
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
FILENAME   = '/etc/hostname'

case node['platform_family']
when 'rhel'
  template FILENAME do
    source "#{node['platform_family']}/hostname.erb"
    owner  'root'
    group  'root'
    mode   '0644'
    variables(
      hostname: node.name
    )
    action :create
    not_if "grep 'Chef' #{FILENAME}"
  end
end
