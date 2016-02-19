#
# Cookbook Name:: baseservicemix
# Recipe:: create_servicemix_group
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
SERVICEMIX_USER = node['baseservicemix']['servicemix_user']

group SERVICEMIX_USER do
  members [SERVICEMIX_USER]
  append  false
  action :create
end
