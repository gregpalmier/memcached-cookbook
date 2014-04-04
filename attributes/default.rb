#careful, this attribute value is actually case sensitive.
default['memcached']['enabled']           = "yes"
default['memcached']['logfile']           = "/var/log/memcached.log"
default['memcached']['memory']            = "128"
default['memcached']['port']              = "11211"
default['memcached']['user']              = "memcache"
default['memcached']['listen_ip']         = "127.0.0.1"
default['memcached']['connection_limit']  = "1024"
