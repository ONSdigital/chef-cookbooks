#
# Cookbook Name:: baseapache
# Recipe:: install_apache_service
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
service 'redis' do
  supports reload: false, restart: true, status: true
  action [:enable, :start]
end
