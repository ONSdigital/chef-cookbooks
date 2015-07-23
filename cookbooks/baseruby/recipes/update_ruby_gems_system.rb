#
# Cookbook Name:: baseruby
# Recipe:: install_ruby_gems_system
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
RUBY_GEMS_UPDATED = node['baseruby']['ruby_gems_updated']

bash 'gem update --system' do
  user  'root'
  group 'root'
  code <<-EOC
    gem update --system
  EOC
  action :run
  only_if { RUBY_GEMS_UPDATED == 'false' }
end

node.set['baseruby']['ruby_gems_updated'] = 'true'
