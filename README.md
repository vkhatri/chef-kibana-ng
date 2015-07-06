kibana-ng Cookbook
================

[![Build Status](https://travis-ci.org/vkhatri/chef-kibana-ng.svg?branch=master)](https://travis-ci.org/vkhatri/chef-kibana-ng)

This is a [Chef] cookbook to manage [Kibana].

This cookbook was heavily inspired from simple-kibana cookbook maintained by jsirex.


## Repository

https://github.com/vkhatri/chef-kibana-ng


## Supported Version

This cookbook was tested for Kibana v4.0.2+ x86_64 version.


## Supported OS

This cookbook was tested on Amazon Linux & Ubuntu and expected to work on other RHEL platforms.


## Recipes

- `kibana-ng::default` - default recipe (used for run_list)

- `kibana-ng::install` - wrapper recipe to install kibana

- `kibana-ng::config` - configures kibana

- `kibana-ng::nginx` - configure kibana nginx proxy

- `kibana-ng::service` - configure kibana service

- `kibana-ng::source` - install kibana from source

- `kibana-ng::user` - install user / group for kibana


## Core Attributes


* `default['kibana']['version']` (default: `4.1.1`): kibana version

* `default['kibana']['tarball_url']` (default: ): kibana download source url

* `default['kibana']['tarball_checksum']` (default: version checksum hash): kibana source sha256sum

* `default['kibana']['user']` (default: `kibana`): kibana user

* `default['kibana']['group']` (default: `kibana`): kibana group

* `default['kibana']['setup_user']` (default: `true`): setup kibana user group

* `default['kibana']['service_name']` (default: `kibana`): kibana service name

* `default['kibana']['service_type']` (default: `sysv`): kibana service type, currently supports only `sysv`

* `default['kibana']['install_method']` (default: `source`): kibana install method, currently supports only `source`

* `default['kibana']['umask']` (default: `0022`): execute resource umask

* `default['kibana']['dir_mode']` (default: ``): kibana file/dir resource mode

* `default['kibana']['parent_dir']` (default: `/opt/kibana`): kibana parent/home directory for different versions

* `default['kibana']['log_dir']` (default: `/var/log/kibana`): kibana service log

* `default['kibana']['conf_dir']` (default: `/etc/kibana`): kibana yaml configuration file directory

* `default['kibana']['install_dir']` (default: `/opt/kibana/kibana`): kibana install / current version location, symlink to current version location

* `default['kibana']['version_dir']` (default: `/opt/kibana/kibana-VERSION`): kibana version's directory location

* `default['kibana']['daemon']` (default: `/opt/kibana/kibana/bin/kibana`): kibana bin location

* `default['kibana']['conf_file']` (default: `/etc/kibana/kibana.yml`): kibana configuration file

* `default['kibana']['log_file']` (default: `/var/log/kibana/kibana.log`): kibana log file location

* `default['kibana']['pid_file']` (default: `/opt/kibana/kibana/kibana.pid`): kibana service pid file location

* `default['kibana']['auth_users']` (default: `{guest:hash}`): nginx auth users hash

* `default['kibana']['nginx_port']` (default: `{guest:hash}`): nginx auth users hash

* `default['kibana']['nginx_auth_file']` (default: `calculated`): nginx auth users file

* `default['kibana']['nginx_port']` (default: `80`): nginx proxy port


## Configuration File kibana.yml Attributes

* `default['kibana']['config']['port']` (default: `5601`): kibana port

* `default['kibana']['config']['host']` (default: `127.0.0.1`): kibana host address

* `default['kibana']['config']['pid_file']` (default: `/opt/kibana/kibana/kibana.pid`): kibana pid file location

* `default['kibana']['config']['elasticsearch_url']` (default: `http://localhost:9200`): elasticsearch url

* `default['kibana']['config']['kibana_index']` (default: `.kibana`): elasticsearch index

* `default['kibana']['config']['default_app_id']` (default: `discover`):

* `default['kibana']['config']['request_timeout']` (default: `300_000`):

* `default['kibana']['config']['shard_timeout']` (default: `0`):

* `default['kibana']['config']['verify_ssl']` (default: `true`):

* `default['kibana']['config']['bundled_plugin_ids']` (default: `[]`):

For more attribute info, visit below links:

https://github.com/elastic/kibana/blob/master/src/server/config/kibana.yml

https://www.elastic.co/guide/en/kibana/current/_setting_kibana_server_properties.html


## Contributing

1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write your change
4. Write tests for your change (if applicable)
5. Run the tests (`rake & rake knife`), ensuring they all pass
6. Write new resource/attribute description to `README.md`
7. Write description about changes to PR
8. Submit a Pull Request using Github


## Copyright & License

Authors:: Virender Khatri and [Contributors]

<pre>
Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
</pre>


[Chef]: https://www.chef.io/
[Kibana]: https://github.com/elastic/kibana/
[Contributors]: https://github.com/vkhatri/chef-kibana-ng/graphs/contributors
