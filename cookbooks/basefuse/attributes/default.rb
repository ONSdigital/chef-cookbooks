#
# Cookbook Name:: basefuse
# Attributes:: default
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
default['basefuse']['fuse_archive']             = 'jboss-fuse-full-6.1.0.redhat-379.zip'
default['basefuse']['fuse_archive_dir']         = 'chef/distros/jbossfuse'
default['basefuse']['fuse_install_root']        = '/opt/fuse'
default['basefuse']['fuse_install_dir']         = '/opt/fuse/jboss-fuse-6.1.0.redhat-379'
default['basefuse']['maven_repository_dir']     = '/opt/fuse/m2'
default['basefuse']['maven_snapshot_dir']       = 'chef/m2'
default['basefuse']['fuse_user']                = 'fuse'
default['basefuse']['fuse_user_home']           = '/home/fuse'
default['basefuse']['fuse_user_process_limit']  = '2048'
default['basefuse']['custom_packages']          = ['sun.misc']

default['basefuse']['fabric']['command_script'] = 'chef/scripts/jbossfuse/bare-fabric'
default['basefuse']['fabric']['openwire_port']  = '53445'
default['basefuse']['fabric']['installed']      = 'false'
