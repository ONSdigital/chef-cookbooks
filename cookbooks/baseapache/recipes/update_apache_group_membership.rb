#
# Cookbook Name:: baseapache
# Recipe:: update_apache_group_membership
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
group 'apache' do
  members 'apache'
  append  true
  action :modify
end
