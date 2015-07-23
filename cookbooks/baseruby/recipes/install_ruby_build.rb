#
# Cookbook Name:: baseruby
# Recipe:: install_ruby_build
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
REPO_PATH = "#{Chef::Config[:file_cache_path]}/ruby-build"

git "#{REPO_PATH}" do
  repository 'https://github.com/sstephenson/ruby-build.git'
  action :sync
end

bash "#{REPO_PATH}/install.sh" do
  cwd "#{REPO_PATH}"
  user  'root'
  group 'root'
  code <<-EOC
    ./install.sh
  EOC
  action :run
  not_if 'test -f /usr/local/bin/ruby-build'
end
