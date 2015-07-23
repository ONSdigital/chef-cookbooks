#
# Cookbook Name:: basetomcat
# Recipe:: create_tomcat_users_config
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
DATA_BAG_NAME           = node['baseos']['credentials_data_bag_name']
CONFIG_FILE             = '/etc/tomcat/tomcat-users.xml'

manager_gui_user        = data_bag_item(DATA_BAG_NAME, 'tomcat')['manager_gui_user']
manager_gui_password    = data_bag_item(DATA_BAG_NAME, 'tomcat')['manager_gui_password']
manager_status_user     = data_bag_item(DATA_BAG_NAME, 'tomcat')['manager_status_user']
manager_status_password = data_bag_item(DATA_BAG_NAME, 'tomcat')['manager_status_password']

template CONFIG_FILE do
  source 'tomcat-users.xml.erb'
  owner  'tomcat'
  group  'tomcat'
  mode   '0660'
  variables(
    manager_gui_user:        manager_gui_user,
    manager_gui_password:    manager_gui_password,
    manager_status_user:     manager_status_user,
    manager_status_password: manager_status_password
  )
  action :create
  not_if "grep 'Chef' #{CONFIG_FILE}"
end
