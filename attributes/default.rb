default['kibana']['version'] = '4.1.2'
default['kibana']['tarball_url'] = "https://download.elasticsearch.org/kibana/kibana/kibana-#{node['kibana']['version']}-linux-x64.tar.gz"
default['kibana']['tarball_checksum']['4.0.2'] = '4cc36e5c6ca7c495667319df75feda1facb7c43a3d9686841f07a2522adec294'
default['kibana']['tarball_checksum']['4.1.0'] = '597e1b1e381b9a9ed9f8a66e115ec4d7a0258fa36c81fe74f1e91b651fcd567a'
default['kibana']['tarball_checksum']['4.1.1'] = '6f42d25f337fd49f38e2af81b9ab6e0c987a199a8c0b2e1410d072f812cb4520'

default['kibana']['user'] = 'kibana'
default['kibana']['group'] = 'kibana'
default['kibana']['setup_user'] = true

default['kibana']['service_name'] = 'kibana'
default['kibana']['service_type'] = 'sysv' # options: sysv
default['kibana']['notify_restart'] = true

default['kibana']['install_method'] = 'source' # options: source

default['kibana']['auth_users']['guest'] = '$apr1$cA/eVUgT$aIoWUPwV5uONJoYslb7lg0'

default['kibana']['umask']        = '0022'
default['kibana']['dir_mode']     = '0755'
default['kibana']['parent_dir']   = '/opt/kibana'
default['kibana']['log_dir']      = '/var/log/kibana'
default['kibana']['conf_dir']     = '/etc/kibana'
default['kibana']['install_dir']  = ::File.join(node['kibana']['parent_dir'], 'kibana')
default['kibana']['version_dir']  = node['kibana']['parent_dir'] + '/kibana-' + node['kibana']['version'] + '-linux-x64'
default['kibana']['daemon']       = ::File.join(node['kibana']['install_dir'], 'bin', 'kibana')

default['kibana']['conf_file'] = ::File.join(node['kibana']['conf_dir'], 'kibana.yml')
default['kibana']['log_file'] = ::File.join(node['kibana']['log_dir'], 'kibana.log')
default['kibana']['pid_file'] = ::File.join(node['kibana']['parent_dir'], 'kibana.pid')

default['kibana']['nginx_auth_file'] = ::File.join(node['nginx']['dir'], 'htpasswd.kibana')
default['kibana']['nginx_port'] = 80

default['nginx']['default_site_enabled'] = false
