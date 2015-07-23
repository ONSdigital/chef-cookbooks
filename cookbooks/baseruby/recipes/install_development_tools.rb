#
# Cookbook Name:: baseruby
# Recipe:: install_development_tools
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
bash 'yum groupinstall Development Tools' do
  user  'root'
  group 'root'
  code <<-EOC
    yum groupinstall 'Development Tools' -y
  EOC
  action :run
  not_if "yum grouplist installed | grep 'Development Tools'"
end
