#
# Cookbook Name:: memcached-cookbook
# Recipe:: default
#
# Copyright (C) 2014 Greg Palmier

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at

#   http://www.apache.org/licenses/LICENSE-2.0

# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

%w(memcached).each do |pkg|
  package pkg do
    action :upgrade
  end
end

template node['memcached']['server_config'] do
  source 'sysconfig.conf.erb'
  owner 'root'
  group 0
  mode 00644
  notifies :restart, 'service[memcached]', :immediately
end

template node['memcached']['service_config'] do
  source 'memcached.conf.erb'
  owner 'root'
  group 0
  mode 00644
  notifies :restart, 'service[memcached]', :immediately
end

service 'memcached' do
  supports status: 'true', restart: 'true', stop: 'true'
  action [:enable, :start]
end
