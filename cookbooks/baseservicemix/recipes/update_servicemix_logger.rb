#
# Cookbook Name:: baseservicemix
# Recipe:: update_servicemix_logger
#
# Copyright 2016, ONS
#
# All rights reserved - Do Not Redistribute
#
SERVICEMIX_INSTALL_DIR = node['baseservicemix']['servicemix_install_dir']
SERVICEMIX_USER        = node['baseservicemix']['servicemix_user']

CONFIG_FILE            = "#{SERVICEMIX_INSTALL_DIR}/etc/org.ops4j.pax.logging.cfg"

# Separate each bundle's log output in the log directory.
command = "sed -i 's/^\(log4j.rootLogger=INFO, \)out\(, osgi:VmLogAppender\)/\1sift\2/' #{CONFIG_FILE}"
execute command do
  user  SERVICEMIX_USER
  group SERVICEMIX_USER
  command command
  action :run
  not_if "grep 'log4j.rootLogger=INFO, sift, osgi:VmLogAppender' #{CONFIG_FILE}"
end
