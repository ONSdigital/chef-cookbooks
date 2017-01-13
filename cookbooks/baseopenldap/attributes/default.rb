#
# Cookbook Name:: baseopenldap
# Attributes:: default
#
# Copyright 2017, ONS
#
# All rights reserved - Do Not Redistribute
#
default['baseopenldap']['packages'] = {
  'rhel' => ['openldap', 'openldap-clients', 'openldap-servers']
}
