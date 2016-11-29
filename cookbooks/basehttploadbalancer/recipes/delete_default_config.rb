#
# Cookbook Name:: basehttploadbalancer
# Recipe:: delete_default_config
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
DEFAULT_CONFIG_FILE = "/etc/nginx/conf.d/default.conf"

file DEFAULT_CONFIG_FILE do
  action :delete
end
