#
# Cookbook Name:: kibana-ng
# Recipe:: install
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

include_recipe 'kibana-ng::user'

[node['kibana']['log_dir'],
 node['kibana']['parent_dir'],
 node['kibana']['conf_dir']
].each do |dir|
  directory dir do
    owner node['kibana']['user']
    group node['kibana']['group']
    mode node['kibana']['dir_mode']
    recursive true
  end
end

fail "invalid install method, valid install methods are 'tarball'" unless %w(tarball).include?(node['kibana']['install_method'])

include_recipe "kibana-ng::#{node['kibana']['install_method']}"
