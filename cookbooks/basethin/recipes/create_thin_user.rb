#
# Cookbook Name:: basethin
# Recipe:: create_thin_user
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
DATA_BAG_NAME    = node['baseos']['credentials_data_bag_name']

THIN_USER        = node['basethin']['thin_user']
THIN_USER_HOME   = node['basethin']['thin_user_home']

thin_user_password = data_bag_item(DATA_BAG_NAME, 'os')['thin_user_password']

user THIN_USER do
  comment  'User account for running Thin web server'
  home     THIN_USER_HOME
  password thin_user_password
  shell    '/sbin/nologin'
  action :create
end
