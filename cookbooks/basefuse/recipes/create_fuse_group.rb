#
# Cookbook Name:: basefuse
# Recipe:: create_fuse_group
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
FUSE_USER = node['basefuse']['fuse_user']

group FUSE_USER do
  members [FUSE_USER]
  append  false
  action :create
end
