#
# Cookbook Name:: basetomcat
# Recipe:: enable_service
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
service 'tomcat' do
  supports reload: false, restart: true, status: true
  action [:enable, :start]
end
