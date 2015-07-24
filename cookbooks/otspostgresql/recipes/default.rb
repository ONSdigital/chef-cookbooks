#
# Cookbook Name:: otspostgresql
# Recipe:: default
#
# Copyright 2015, Inchmery Consulting Ltd
#
# All rights reserved - Do Not Redistribute
#

include_recipe "otspostgresql::users"
include_recipe "otspostgresql::directories"
include_recipe "otspostgresql::installPostgreSQL"
include_recipe "otspostgresql::postInstallPostgreSQL"
