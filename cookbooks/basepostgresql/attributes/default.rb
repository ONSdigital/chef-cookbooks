#
# Cookbook Name:: basepostgresql
# Attributes:: default
#
# Copyright 2015, ONS
#
# All rights reserved - Do Not Redistribute
#
default['basepostgresql']['postgres_user']          = 'postgres'

default['postgresql']['password']['postgres']       = 'postgres'
default['postgresql']['enable_pgdg_yum']            = true
default['postgresql']['database_name']              = 'postgres'
default['postgresql']['version']                    = '9.3'
default['postgresql']['dir']                        = '/var/lib/pgsql/9.3/data'
default['postgresql']['client']['packages']         = ['postgresql93', 'postgresql93-devel']
default['postgresql']['contrib']['packages']        = ['postgresql93-contrib']
default['postgresql']['server']['packages']         = ['postgresql93-server']

if platform_family?('rhel') and node['platform_version'].to_i >= 7
  default['postgresql']['server']['service_name']   = 'postgresql-9.3.service'
else
  default['postgresql']['server']['service_name']   = 'postgresql93'
end

default['postgresql']['config']['data_directory']   = '/var/lib/pgsql/9.3/data'
default['postgresql']['config']['listen_addresses'] = '*'
default['postgresql']['config']['log_timezone']     = 'GB'
default['postgresql']['config']['lc_messages']      = 'en_GB.UTF-8'
default['postgresql']['config']['lc_monetary']      = 'en_GB.UTF-8'
default['postgresql']['config']['lc_numeric']       = 'en_GB.UTF-8'
default['postgresql']['config']['lc_time']          = 'en_GB.UTF-8'

default['postgresql']['contrib']['extensions'] = [
  'dblink',
  'pageinspect',
  'pg_buffercache',
  'pg_freespacemap',
  'pgrowlocks',
  'pg_stat_statements',
  'pgstattuple'
]

default['postgresql']['pgdg']['repo_rpm_url'] = {
  '9.3' => {
    'amazon' => {
      '2014' => {
        'x86_64' => 'http://yum.postgresql.org/9.3/redhat/rhel-6-x86_64/pgdg-redhat93-9.3-1.noarch.rpm'
      }
    },
    'centos' => {
      '7' => {
        'x86_64' => 'http://yum.postgresql.org/9.3/redhat/rhel-7-x86_64/pgdg-centos93-9.3-1.noarch.rpm'
      }
    },
    'redhat' => {
      '7' => {
        'x86_64' => 'http://yum.postgresql.org/9.3/redhat/rhel-7-x86_64/pgdg-redhat93-9.3-1.noarch.rpm'
      }
    }
  }
}

default['postgresql']['pg_hba'] = [
  { comment: '# "local" is for Unix domain socket connections only',
    type: 'local', db: 'all', user: 'all', addr: nil, method: 'trust' },
  { comment: '# IPv4 local connections:',
    type: 'host', db: 'all', user: 'all', addr: '127.0.0.1/32', method: 'trust' },
  { comment: '# IPv6 local connections:',
    type: 'host', db: 'all', user: 'all', addr: '::1/128', method: 'ident' }
]
