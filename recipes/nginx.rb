#
# Cookbook Name:: kibana-ng
# Recipe:: nginx
#
# Copyright 2015, Virender Khatri
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'nginx'

template node['kibana']['nginx_auth_file'] do
  owner node['nginx']['user']
  group node['nginx']['group']
  mode 0400
  source 'htpasswd.erb'
  variables(:users => node['kibana']['auth_users'])
end

template ::File.join(node['nginx']['dir'], 'sites-available', 'kibana') do
  cookbook node['kibana']['cookbook']
  source 'nginx.vhost.erb'
  mode 0644
  variables(:nginx_port => node['kibana']['nginx_port'],
            :nginx_auth_file => node['kibana']['nginx_auth_file'],
            :kibana_port => node['kibana']['config']['port'],
            :kibana_host => node['kibana']['config']['host']
           )
  notifies :reload, 'service[nginx]', :delayed
end

nginx_site 'kibana' do
  enable true
end
