#
# Cookbook Name:: basenginx
# Recipe:: install_packages
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
PACKAGES = node['basenginx']['packages']

PACKAGES.keys.each do |key|
  if node['platform_family'] == key
    PACKAGES[key].each do |pkg|
      package pkg do
        action :install
      end
    end
  end
end
