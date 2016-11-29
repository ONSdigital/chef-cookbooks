#
# Cookbook Name:: basehttploadbalancer
# Recipe:: default
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'basenginx'

include_recipe 'basehttploadbalancer::create_load_balancer_config'
include_recipe 'basehttploadbalancer::delete_default_config'
