#
# Cookbook Name:: basenginx
# Recipe:: install_nginx_service
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
service 'nginx' do
  supports reload: true, restart: true, status: true
  action [:enable, :start]
end
