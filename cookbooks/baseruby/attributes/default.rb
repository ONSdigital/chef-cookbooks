#
# Cookbook Name:: baseruby
# Attributes:: default
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
default['baseruby']['ruby_version']      = '2.3.0'
default['baseruby']['ruby_install_dir']  = '/usr'
default['baseruby']['ruby_gems_updated'] = 'false'
default['baseruby']['packages'] = {
  'rhel' => ['libffi-devel', 'libyaml', 'openssl-devel', 'postgresql-devel', 'readline-devel', 'zlib-devel']
}
