name 'kibana-ng'
maintainer 'Virender Khatri'
maintainer_email 'vir.khatri@gmail.com'
license 'Apache 2.0'
description 'Installs/Configures ElasticSearch Kibana'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version '0.2.3'

depends 'nginx'

%w(amazon centos fedora ubuntu).each do |os|
  supports os
end
