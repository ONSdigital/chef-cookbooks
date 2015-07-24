#
# Cookbook Name:: otspostgresql
# Recipe:: users
#
# Copyright 2015, Inchmery Consulting Ltd
#
# All rights reserved - Do Not Redistribute
#

user node[:postgresql][:pguser] do
	action :create
	shell "/bin/bash"
	home "/home/#{node[:postgresql][:pguser]}"
	comment "Postgresql software owner"
	password "postgres"
	action :create
end
