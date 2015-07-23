#
# Cookbook Name:: baseapache
# Recipe:: install_apache_service
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
service 'httpd' do
  supports reload: true, restart: true, status: true
  action [:enable, :start]
end
