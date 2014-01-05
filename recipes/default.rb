#
# Cookbook Name:: memcached-cookbook
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#
%w{memcached php5-memcached}.each do |pkg|
  package pkg do
    action :upgrade
  end
end

template "/etc/memcached.conf" do
 source "memcached.conf.erb"
 owner "root"
 group 0
 mode 00644
end

template "/etc/default/memcached" do
 source "sysconfig.conf.erb"
 owner "root"
 group 0
 mode 00644
end
