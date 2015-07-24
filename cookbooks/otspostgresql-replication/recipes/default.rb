#
# Cookbook Name:: otspostgresql-replication
# Recipe:: default
#
# Copyright 2015, Inchmery Consulting Ltd
#
# All rights reserved - Do Not Redistribute
#

include_recipe "otspostgresql-replication::users"
include_recipe "otspostgresql-replication::directories"
include_recipe "otspostgresql-replication::installPostgreSQL"
include_recipe "otspostgresql-replication::postInstallPostgreSQL"
