#
# Cookbook Name:: basepostgresql
# Recipe:: default
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
include_recipe 'baseos'
include_recipe 'postgresql::server'
include_recipe 'postgresql::contrib'
