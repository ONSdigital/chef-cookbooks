#
# Cookbook Name:: basenginx
# Recipe:: add_nginx_yum_repository
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
cookbook_file '/etc/yum.repos.d/nginx.repo' do
  source   "#{node['platform_family']}/nginx.repo"
  mode     0644
  notifies :create, 'ruby_block[reload-internal-yum-cache]', :immediately
  action   :create
end

ruby_block 'reload-internal-yum-cache' do
  block do
    Chef::Provider::Package::Yum::YumCache.instance.reload
  end
  action :nothing
end
