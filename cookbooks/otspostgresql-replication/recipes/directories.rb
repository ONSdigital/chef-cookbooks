#
# Cookbook Name:: otspostgresql-replication
# Recipe:: directories
#
# Copyright 2015, Inchmery Consulting Ltd
#
# All rights reserved - Do Not Redistribute
#

# Directory for product binaries
directory node[:postgresql][:bin_dir] do
	owner 'postgres'
	group 'postgres'
	mode '0755'
	recursive true 
	action :create
end

# PostgreSQL data directory
directory node[:postgresql][:data_dir] do
	owner 'postgres'
	group 'postgres'
	mode '0755'
	recursive true
	action :create
end

# PostgreSQL tablespace directory
directory node[:postgresql][:tblspce_dir] do
	owner 'postgres'
	group 'postgres'
	mode '0755'
	recursive true
	action :create
end

# Backup directory
directory node[:postgresql][:backup_root] do
	owner 'postgres'
	group 'postgres'
	mode '0755'
	recursive true
	action :create
end

# Archive WAL directory
directory node[:postgresql][:wal_dir] do
	owner 'postgres'
	group 'postgres'
	mode '0755'
	recursive true
	action :create
end

# Dumpfile directory
directory node[:postgresql][:dump_dir] do
	owner 'postgres'
	group 'postgres'
	mode '0755'
	recursive true
	action :create
end

# DBA scripts
directory node[:postgresql][:dba_root] do
	owner 'postgres'
	group 'postgres'
	mode '0755'
	recursive true
	action :create
end

directory node[:postgresql][:dba_bin] do
	owner 'postgres'
	group 'postgres'
	mode '0755'
	recursive true
	action :create
end

directory node[:postgresql][:dba_config] do
	owner 'postgres'
	group 'postgres'
	mode '0755'
	recursive true
	action :create
end

directory node[:postgresql][:dba_media] do
	owner 'postgres'
	group 'postgres'
	mode '0755'
	recursive true
	action :create
end

# Change permission on directory structure
execute "chown_u01" do
	command "chown -R postgres:postgres /#{node[:postgresql][:bin_mount]}"
	user "root"
	action :run
end

execute "chown_u02" do
	command "chown -R postgres:postgres /#{node[:postgresql][:data_mount]}"
	user "root"
	action :run
end

execute "chown_backup" do
        command "chown -R postgres:postgres /#{node[:postgresql][:bak_mount]}"
	user "root"
	action :run
end

