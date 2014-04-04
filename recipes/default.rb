#
# Cookbook Name:: memcached-cookbook
# Recipe:: default
#
# Copyright (C) 2014 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#
%w{memcached}.each do |pkg|
  package pkg do
    action :upgrade
  end
end

service 'memcached' do
  supports :status => true, :restart => true, :stop => true
  action [ :enable, :start ]
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
