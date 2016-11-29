#
# Cookbook Name:: basehttploadbalancer
# Recipe:: create_load_balancer_config
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
BALANCING_METHOD = node['basehttploadbalancer']['balancing_method']
CLUSTER_NAME     = node['basehttploadbalancer']['cluster_name']
ORIGIN_SERVERS   = node['basehttploadbalancer']['origin_servers']

CONFIG_FILE      = "/etc/nginx/conf.d/load-balancer.conf"

raise 'No value provided for cluster_name default attribute' if CLUSTER_NAME.nil? or CLUSTER_NAME.length == 0
raise 'No value provided for origin_servers default attribute' unless ORIGIN_SERVERS.any?

template CONFIG_FILE do
  source "#{node['platform_family']}/load-balancer.conf.erb"
  owner  'root'
  group  'root'
  mode   '0644'
  variables(
    balancing_method: BALANCING_METHOD,
    cluster_name:     CLUSTER_NAME,
    origin_servers:   ORIGIN_SERVERS
  )
  notifies :restart, 'service[nginx]'
  action :create
  not_if "grep 'Chef' #{CONFIG_FILE}"
end
