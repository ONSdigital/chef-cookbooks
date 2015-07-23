#
# Cookbook Name:: baseruby
# Recipe:: install_ruby
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
VERSION     = node['baseruby']['ruby_version']
INSTALL_DIR = node['baseruby']['ruby_install_dir']

bash "/usr/local/bin/ruby-build #{VERSION} #{INSTALL_DIR}" do
  user  'root'
  group 'root'
  code <<-EOC
    /usr/local/bin/ruby-build #{VERSION} #{INSTALL_DIR}
  EOC
  action :run
  not_if "test -f #{INSTALL_DIR}/bin/ruby"
end
