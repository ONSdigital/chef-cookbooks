#
# Cookbook Name:: basethin
# Recipe:: install_thin_ruby_gem
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
gem_package 'thin' do
  options '--no-document'
  action :install
end
