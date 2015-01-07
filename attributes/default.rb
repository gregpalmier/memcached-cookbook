# careful, this attribute value is actually case sensitive.
default['memcached']['enabled']           = 'yes'
default['memcached']['logfile']           = '/var/log/memcached.log'
default['memcached']['memory']            = '128'
default['memcached']['port']              = '11211'
default['memcached']['listen_ip']         = '127.0.0.1'
default['memcached']['connection_limit']  = '1024'

case node['platform_family']
when 'rhel', 'fedora'
  default['memcached']['server_config']     = '/etc/sysconfig/memcached'
  default['memcached']['service_config']    = '/etc/memcached.conf'
  default['memcached']['user']              = 'apache'
when 'debian'
  default['memcached']['server_config']     = '/etc/default/memcached'
  default['memcached']['service_config']    = '/etc/memcached.conf'
  default['memcached']['user']              = 'www-data'
end
