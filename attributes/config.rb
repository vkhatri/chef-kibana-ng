# https://github.com/elastic/kibana/blob/master/src/server/config/kibana.yml
# https://www.elastic.co/guide/en/kibana/current/_setting_kibana_server_properties.html

default['kibana']['config']['port'] = 5601
default['kibana']['config']['host'] = node['ipaddress']
default['kibana']['config']['pid_file'] = ::File.join(node['kibana']['parent_dir'], 'kibana.pid')
default['kibana']['config']['elasticsearch_url'] = 'http://localhost:9200'
default['kibana']['config']['kibana_index'] = '.kibana'
default['kibana']['config']['default_app_id'] = 'discover'
default['kibana']['config']['request_timeout'] = 300_000
default['kibana']['config']['shard_timeout'] = 0
default['kibana']['config']['verify_ssl'] = true
default['kibana']['config']['bundled_plugin_ids'] = [
  'plugins/dashboard/index',
  'plugins/discover/index',
  'plugins/doc/index',
  'plugins/kibana/index',
  'plugins/metric_vis/index',
  'plugins/settings/index',
  'plugins/table_vis/index',
  'plugins/vis_types/index',
  'plugins/visualize/index'
]
