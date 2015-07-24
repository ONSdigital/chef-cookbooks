#
# Cookbook Name:: otspostgresql
# Attributes:: default
#
# Copyright 2015, Inchmery Consulting Ltd
#
# All rights reserved - Do Not Redistribute
#

# System level parameters
# Used to drive the entire installation
# These will be the main ones changed before execution
default[:postgresql][:version]     = "9.2"
default[:postgresql][:port]        = "5432"
default[:postgresql][:pguser]	   = "postgres"
default[:postgresql][:bkuser]	   = "backup_user"
default[:postgresql][:bin_mount]   = "u01"
default[:postgresql][:data_mount]  = "u02"
default[:postgresql][:bak_mount]   = "backup"
default[:postgresql][:pg_media]    = "postgresql-9.2.13-1-linux-x64.run"

# Directories
# Generally you wont want to edit these, they are largely derived 
# from the system level parameters
default[:postgresql][:bin_dir]     = "/#{node[:postgresql][:bin_mount]}/app/postgres/product/#{node[:postgresql][:version]}"
default[:postgresql][:data_dir]    = "/#{node[:postgresql][:data_mount]}/app/postgres/pgdata_#{node[:postgresql][:port]}"
default[:postgresql][:tblspce_dir] = "/#{node[:postgresql][:data_mount]}/app/postgres/pgtablespace_#{node[:postgresql][:port]}"
default[:postgresql][:backup_root] = "/#{node[:postgresql][:bak_mount]}/app/postgres/backups/cluster_#{node[:postgresql][:port]}"
default[:postgresql][:dump_dir]   = "/#{node[:postgresql][:bak_mount]}/app/postgres/dumps"
default[:postgresql][:wal_dir]    = "/#{node[:postgresql][:bak_mount]}/app/postgres/walarchive/cluster_#{node[:postgresql][:port]}"
default[:postgresql][:dba_root]    = "/#{node[:postgresql][:bin_mount]}/app/postgres/DBAscripts"
default[:postgresql][:dba_bin]	   = "#{node[:postgresql][:dba_root]}/bin"
default[:postgresql][:dba_config]  = "#{node[:postgresql][:dba_root]}/config"
default[:postgresql][:dba_media]   = "#{node[:postgresql][:dba_root]}/media"

# PostgreSQL cluster parameters
# You should change these to ensure that the PostgreSQL server
# is configured as you want
default[:postgresql][:max_connections]     =  "100"
default[:postgresql][:shared_buffers]	   =  "1024MB"
default[:postgresql][:work_mem]		   =  "16MB"
default[:postgresql][:wal_level]	   =  "archive"
default[:postgresql][:checkpoint_segments] =  "31"
default[:postgresql][:checkpoint_completion_target] = "0.9"
default[:postgresql][:archive_mode] = "on"
default[:postgresql][:max_wal_senders] = "3"
default[:postgresql][:effective_cache_size] = "2048MB"
default[:postgresql][:log_filename] = "postgresql-%a.log"
default[:postgresql][:log_truncate_on_rotation] = "on"
default[:postgresql][:log_rotation_size] = "0"
default[:postgresql][:archive_command] = "test ! -f #{node[:postgresql][:wal_dir]}/%f && cp -p %p #{node[:postgresql][:wal_dir]}/%f"
