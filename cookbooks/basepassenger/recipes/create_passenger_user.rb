#
# Cookbook Name:: basepassenger
# Recipe:: create_passenger_user
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
DATA_BAG_NAME       = node['baseos']['credentials_data_bag_name']

PASSENGER_USER      = node['basepassenger']['passenger_user']
PASSENGER_USER_HOME = node['basepassenger']['passenger_user_home']

passenger_user_password = data_bag_item(DATA_BAG_NAME, 'os')['passenger_user_password']

user PASSENGER_USER do
  comment  'User account for running Phusion Passenger web server'
  home     PASSENGER_USER_HOME
  password passenger_user_password
  shell    '/sbin/nologin'
  action :create
end
