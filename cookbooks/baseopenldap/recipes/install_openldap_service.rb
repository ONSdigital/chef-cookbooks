#
# Cookbook Name:: baseopenldap
# Recipe:: install_openldap_service
#
# Copyright 2017, ONS
#
# All rights reserved - Do Not Redistribute
#
service 'slapd' do
  supports reload: true, restart: true, status: true
  action [:enable, :start]
end
