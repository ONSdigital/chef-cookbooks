#
# Cookbook Name:: otspostgresql
# Recipe:: postInstallPostgreSQL
#
# Copyright 2015, Inchmery Consulting Ltd
#
# All rights reserved - Do Not Redistribute
#

# Copy DBA scripts and config onto the server
#
# .bash_profile
template "/home/#{node[:postgresql][:pguser]}/.bash_profile" do
	source "bash_profile.erb"
	mode 0644
	owner "#{node[:postgresql][:pguser]}"
	group "#{node[:postgresql][:pguser]}"
end

# .psqlrc
template "/home/#{node[:postgresql][:pguser]}/.psqlrc" do
	source "psqlrc.erb"
	mode 0644
	owner "#{node[:postgresql][:pguser]}"
	group "#{node[:postgresql][:pguser]}"
end

# create_pg_db.sh
template "#{node[:postgresql][:dba_bin]}/create_pg_db.sh" do
	source "create_pg_db.sh.erb"
	mode 0700
	owner "#{node[:postgresql][:pguser]}"
	group "#{node[:postgresql][:pguser]}"
end

# create_pg_tablespace.sh
template "#{node[:postgresql][:dba_bin]}/create_pg_tablespace.sh" do
	source "create_pg_tablespace.sh.erb"
	mode 0700
	owner "#{node[:postgresql][:pguser]}"
	group "#{node[:postgresql][:pguser]}"
end

# create_3tier_user.sh
template "#{node[:postgresql][:dba_bin]}/create_3tier_user.sh" do
	source "create_3tier_user.sh.erb"
	mode 0700
	owner "#{node[:postgresql][:pguser]}"
	group "#{node[:postgresql][:pguser]}"
end

# drop_3tier_user.sh
template "#{node[:postgresql][:dba_bin]}/drop_3tier_user.sh" do
	source "drop_3tier_user.sh.erb"
	mode 0700
	owner "#{node[:postgresql][:pguser]}"
	group "#{node[:postgresql][:pguser]}"
end

# export_pg_schema.sh
template "#{node[:postgresql][:dba_bin]}/export_pg_schema.sh" do
	source "export_pg_schema.sh.erb"
	mode 0700
	owner "#{node[:postgresql][:pguser]}"
	group "#{node[:postgresql][:pguser]}"
end

# postgres_cluster_hot_backup.sh
template "#{node[:postgresql][:dba_bin]}/postgres_cluster_hot_backup.sh" do
	source "postgres_cluster_hot_backup.sh.erb"
	mode 0700
	owner "#{node[:postgresql][:pguser]}"
	group "#{node[:postgresql][:pguser]}"
end

# set_3tier_privileges.sh
template "#{node[:postgresql][:dba_bin]}/set_3tier_privileges.sh" do
	source "set_3tier_privileges.sh.erb"
	mode 0700
	owner "#{node[:postgresql][:pguser]}"
	group "#{node[:postgresql][:pguser]}"
end

# .pgpass
template "/home/#{node[:postgresql][:pguser]}/.pgpass" do
	source "pgpass.erb"
	mode 0600
	owner "#{node[:postgresql][:pguser]}"
	group "#{node[:postgresql][:pguser]}"
end

# Create database users
# Database backup user
execute "create_backup_db_user" do
	command "#{node[:postgresql][:bin_dir]}/bin/psql -p #{node[:postgresql][:port]} -h localhost -c \"CREATE ROLE #{node[:postgresql][:bkuser]} REPLICATION LOGIN ENCRYPTED PASSWORD 'ChangeMe'\""
	user "#{node[:postgresql][:pguser]}"
	action :run
end

# Authentication
# pg_hba.conf
template "#{node[:postgresql][:data_dir]}/pg_hba.conf" do
	source "pg_hba.conf.erb"
	mode 0600
	owner "#{node[:postgresql][:pguser]}"
	group "#{node[:postgresql][:pguser]}"
end

# PostgreSQL Configuration
# postgresql.conf
template "#{node[:postgresql][:data_dir]}/postgresql.conf" do
	source "postgresql.conf.erb"
	mode 0600
	owner "#{node[:postgresql][:pguser]}"
	group "#{node[:postgresql][:pguser]}"
end

# Scheduled Tasks
# crontab
template "#{node[:postgresql][:dba_config]}/crontab.template" do
	source "crontab.erb"
	mode 0600
	owner "#{node[:postgresql][:pguser]}"
	group "#{node[:postgresql][:pguser]}"
end

execute "copy_cron" do
	command "crontab #{node[:postgresql][:dba_config]}/crontab.template"
	user "#{node[:postgresql][:pguser]}"
	action :run
end

# Restart PostgresQL service
execute "restart_postgres" do
	command "#{node[:postgresql][:bin_dir]}/bin/pg_ctl restart -D #{node[:postgresql][:data_dir]}"
	user "#{node[:postgresql][:pguser]}"
	action :run
end
