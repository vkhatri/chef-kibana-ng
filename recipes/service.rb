#
# Cookbook Name:: kibana-ng
# Recipe:: service
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

template '/etc/init.d/kibana' do
  source "init.#{node['platform_family']}.erb"
  mode 0755
  variables(:daemon => node['kibana']['daemon'],
            :conf_file => node['kibana']['conf_file'],
            :log_file => node['kibana']['log_file'],
            :pid_file => node['kibana']['pid_file'],
            :elasticsearch_url => node['kibana']['config']['elasticsearch_url'],
            :user => node['kibana']['user'])
  notifies :restart, 'service[kibana]', :delayed if node['kibana']['notify_restart']
end

service 'kibana' do
  supports :status => true, :reload => true, :restart => true
  action [:enable, :start]
end
