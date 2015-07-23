#
# Cookbook Name:: baseos
# Recipe:: update_timezone
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
TIMEZONE         = node['baseos']['timezone']
TIMEZONE_UDPATED = node['baseos']['timezone_updated']

case node['platform_family']
when 'rhel'
  bash "/usr/bin/timedatectl set-timezone #{TIMEZONE}" do
    user  'root'
    group 'root'
    code <<-EOC
      /usr/bin/timedatectl set-timezone #{TIMEZONE}
    EOC
    action :run
    only_if { TIMEZONE_UDPATED == 'false' }
  end

  node.set['baseos']['timezone_updated'] = 'true'
end
