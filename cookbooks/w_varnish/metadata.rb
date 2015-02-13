name             'w_varnish'
maintainer       'Joel Handwell'
maintainer_email 'joelhandwell@gmail.com'
license          'apachev2'
description      'Installs/Configures w_varnish'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2'

depends 'git'
depends 'varnish'
depends 'apt-repo'
depends 'monit'
depends 'firewall'