#
# Cookbook Name:: kibana-ng
# Recipe:: source
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

tarball_file  = ::File.join(node['kibana']['parent_dir'], ::File.basename(node['kibana']['tarball_url']))

# stop kibana service if running for version upgrade
service 'kibana' do
  action :stop
  only_if { File.exist?("/etc/init.d/#{node['kibana']['service_name']}") && !File.exist?(node['kibana']['version_dir']) }
end

# kibana version tarball
remote_file tarball_file do
  source node['kibana']['tarball_url']
  not_if { File.exist?(node['kibana']['daemon']) }
end

# extract tarball
execute 'extract_kibana_tarball' do
  user node['kibana']['user']
  group node['kibana']['group']
  umask node['kibana']['umask']
  cwd node['kibana']['parent_dir']
  command "tar xzf #{tarball_file}"
  creates node['kibana']['daemon']
  notifies :restart, 'service[kibana]', :delayed
end

remote_file tarball_file do
  action :delete
end

# link current version_dir to install_dir
link node['kibana']['install_dir'] do
  to node['kibana']['version_dir']
  owner node['kibana']['user']
  group node['kibana']['group']
  notifies :restart, 'service[kibana]', :delayed
end
