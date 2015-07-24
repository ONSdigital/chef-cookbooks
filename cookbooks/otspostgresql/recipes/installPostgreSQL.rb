# Cookbook Name:: otspostgresql
# Recipe:: installPostgreSQL
#
# Copyright 2015, Inchmery Consulting Ltd
#
# All rights reserved - Do Not Redistribute
#

# You have two choices:
# 1 (default) - the installation media will be downloaded from EnterpriseDB
# 2 Download the file and stage yourself if the db server does not have external access to the internet. In this case uncomment the following section and comment out the remote_file call.

# Copy installation media onto the server
#cookbook_file "#{node[:postgresql][:pg_media]}" do
#	path "#{node[:postgresql][:dba_media]}/#{node[:postgresql][:pg_media]}"
#	mode 0700
#	action :create_if_missing
#end

# Download the installer from EnterpriseDB
remote_file "#{node[:postgresql][:dba_media]}/#{node[:postgresql][:pg_media]}" do
	source "http://get.enterprisedb.com/postgresql/#{node[:postgresql][:pg_media]}"
	mode 0700
end

# Perform the installation
execute "install_postgres_binaries" do
	command "#{node[:postgresql][:dba_media]}/#{node[:postgresql][:pg_media]} --unattendedmodeui minimal --mode unattended --prefix #{node[:postgresql][:bin_dir]} --datadir #{node[:postgresql][:data_dir]} --superpassword ChangeMe --servicename postgres-#{node[:postgresql][:version]} --locale en_GB.utf8"
	user "root"
	action :run
end

