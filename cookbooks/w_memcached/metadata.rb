name             'w_memcached'
maintainer       'Joel Handwell'
maintainer_email 'joelhandwell@gmail.com'
license          'apachev2'
description      'Installs/Configures memcached'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2'

depends 'apt'
depends 'memcached'
depends 'firewall'
depends 'monit'