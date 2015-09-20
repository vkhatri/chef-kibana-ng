default['kibana']['version'] = '4.1.2'

default['kibana']['user'] = 'kibana'
default['kibana']['group'] = 'kibana'
default['kibana']['setup_user'] = true

default['kibana']['service_name'] = 'kibana'
default['kibana']['service_type'] = 'sysv' # options: sysv
default['kibana']['notify_restart'] = true

default['kibana']['install_method'] = 'tarball' # options: tarball

default['kibana']['auth_users']['guest'] = '$apr1$cA/eVUgT$aIoWUPwV5uONJoYslb7lg0'

default['kibana']['umask']        = '0022'
default['kibana']['dir_mode']     = '0755'
default['kibana']['parent_dir']   = '/opt/kibana'
default['kibana']['log_dir']      = '/var/log/kibana'
default['kibana']['conf_dir']     = '/etc/kibana'
default['kibana']['install_dir']  = ::File.join(node['kibana']['parent_dir'], 'kibana')
default['kibana']['daemon']       = ::File.join(node['kibana']['install_dir'], 'bin', 'kibana')

default['kibana']['conf_file'] = ::File.join(node['kibana']['conf_dir'], 'kibana.yml')
default['kibana']['log_file'] = ::File.join(node['kibana']['log_dir'], 'kibana.log')
default['kibana']['pid_file'] = ::File.join(node['kibana']['parent_dir'], 'kibana.pid')

default['kibana']['nginx_auth_file'] = ::File.join(node['nginx']['dir'], 'htpasswd.kibana')
default['kibana']['nginx_port'] = 80

default['nginx']['default_site_enabled'] = false
