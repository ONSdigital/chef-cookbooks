#
# Cookbook Name:: baseredis
# Recipe:: create_redis_config
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
DATA_BAG_NAME     = node['baseos']['credentials_data_bag_name']

BIND              = node['baseredis']['bind']

REDIS_CONFIG_FILE = '/etc/redis.conf'
password          = data_bag_item(DATA_BAG_NAME, 'redis')['password']

template REDIS_CONFIG_FILE do
  source "redis.conf.erb"
  owner  'redis'
  group  'root'
  mode   '0644'
  variables(
    bind:     BIND,
    password: password
  )
  action :create
  not_if "grep 'Chef' #{REDIS_CONFIG_FILE}"
end
