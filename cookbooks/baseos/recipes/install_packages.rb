#
# Cookbook Name:: baseos
# Recipe:: install_packages
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
PACKAGES = node['baseos']['packages']

PACKAGES.keys.each do |key|
  if node['platform_family'] == key
    PACKAGES[key].each do |pkg|
      package pkg do
        action :install
      end
    end
  end
end
