#
# Cookbook Name:: baseservicemix
# Attributes:: default
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
default['baseservicemix']['servicemix_archive']            = 'apache-servicemix-6.1.0.zip'
default['baseservicemix']['servicemix_archive_dir']        = 'chef/distros/apacheservicemix'
default['baseservicemix']['servicemix_install_root']       = '/opt/servicemix'
default['baseservicemix']['servicemix_install_dir']        = '/opt/servicemix/apache-servicemix-6.1.0'
default['baseservicemix']['maven_repository_dir']          = '/opt/servicemix/m2'
default['baseservicemix']['servicemix_user']               = 'servicemix'
default['baseservicemix']['servicemix_user_home']          = '/home/servicemix'
default['baseservicemix']['command_script']                = 'chef/scripts/apacheservicemix/base-properties'
default['baseservicemix']['openwire_port']                 = '53445'
