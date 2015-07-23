#
# Cookbook Name:: basefuse
# Recipe:: copy_maven_repository
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
FILE_STORE           = 'filestore'
FILE_STORE_PORT      = node['baseos']['filestore']['port']

MAVEN_REPOSITORY_DIR = node['basefuse']['maven_repository_dir']
MAVEN_SNAPSHOT_DIR   = node['basefuse']['maven_snapshot_dir']
FUSE_USER            = node['basefuse']['fuse_user']

# This is a quick and dirty recipe to put a local Maven repository on a node by
# extracting a tar file until we have a proper solution utilising an NFS share.
remote_file "GET http://#{FILE_STORE}:#{FILE_STORE_PORT}/#{MAVEN_SNAPSHOT_DIR}/snapshot.tar.gz" do
  source "http://#{FILE_STORE}:#{FILE_STORE_PORT}/#{MAVEN_SNAPSHOT_DIR}/snapshot.tar.gz"
  path "#{MAVEN_REPOSITORY_DIR}/snapshot.tar.gz"
  action :create
  not_if "test -d #{MAVEN_REPOSITORY_DIR}/repository"
end

bash "tar --extract --file #{MAVEN_REPOSITORY_DIR}/snapshot.tar.gz" do
  cwd   MAVEN_REPOSITORY_DIR
  user  'root'
  group 'root'
  code <<-EOC
    tar --extract --file #{MAVEN_REPOSITORY_DIR}/snapshot.tar.gz &&
    mv #{MAVEN_REPOSITORY_DIR}/snapshot #{MAVEN_REPOSITORY_DIR}/repository &&
    chown --recursive #{FUSE_USER}:#{FUSE_USER} #{MAVEN_REPOSITORY_DIR} &&
    rm --force #{MAVEN_REPOSITORY_DIR}/snapshot.tar.gz
  EOC
  action :run
  not_if "test -d #{MAVEN_REPOSITORY_DIR}/repository"
end
