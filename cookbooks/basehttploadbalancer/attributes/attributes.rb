#
# Cookbook Name:: basehttploadbalancer
# Attributes:: default
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
default['basehttploadbalancer']['balancing_method'] = 'least_conn'
default['basehttploadbalancer']['cluster_name']     = ''
default['basehttploadbalancer']['origin_servers']   = []
