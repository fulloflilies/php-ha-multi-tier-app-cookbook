# -*- mode: ruby -*-
# vi: set ft=ruby :
source 'https://supermarket.chef.io'

cookbook 'ubuntu'
cookbook 'apt'
cookbook 'apt-repo', git: 'https://github.com/sometimesfood/chef-apt-repo.git'
cookbook 'git'
cookbook 'monit', git: 'https://github.com/phlipper/chef-monit.git'
cookbook 'firewall', git: 'https://github.com/opscode-cookbooks/firewall.git', ref: '8f3de6039bb39ef5cb4b8e4b74cf22ab905d2d87'
cookbook 'ntp'
cookbook 'sudo'
cookbook 'timezone-ii'
cookbook 'vmware-tools', git: 'https://github.com/tamucookbooks/vmware-tools.git'

cookbook 'varnish'
cookbook 's3_file'
cookbook 'apache2', git: 'https://github.com/joelhandwell/apache2.git'
cookbook 'php', git: 'https://github.com/maxwellshim/chef-php.git'
cookbook 'php-fpm', git: 'https://github.com/yevgenko/cookbook-php-fpm.git'
cookbook 'xdebug', git: 'https://github.com/joelhandwell/xdebug.git'
cookbook 'phpmyadmin', git: 'https://github.com/priestjim/chef-phpmyadmin.git', ref: '9985cc1b7915ce07a2e8d3d240635d6c86d1e6d1'
cookbook 'memcached'
cookbook 'percona', git: 'https://github.com/joelhandwell/chef-percona.git', branch: "dedup_logdir"
cookbook 'xinetd', git: 'https://github.com/joelhandwell/cookbook-xinetd.git'

group :wrapper do
  cookbook 'w_common', path: 'cookbooks/w_common'
  cookbook 'w_varnish', path: 'cookbooks/w_varnish'
  cookbook 'w_apache', path: 'cookbooks/w_apache'
  cookbook 'w_memcached', path: 'cookbooks/w_memcached'
  cookbook 'w_percona', path: 'cookbooks/w_percona'
end

group :testkitchen do
  cookbook 'bash'
  cookbook 'testkitchen', path: 'cookbooks/testkitchen'
end