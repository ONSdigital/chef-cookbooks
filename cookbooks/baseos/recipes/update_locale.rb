#
# Cookbook Name:: baseos
# Recipe:: update_locale
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
FILENAME = '/etc/sysconfig/i18n'

template FILENAME do
  source "#{node['platform_family']}/i18n.erb"
  owner  'root'
  group  'root'
  mode   '0644'
  action :create
  not_if "grep 'Chef' #{FILENAME}"
end
