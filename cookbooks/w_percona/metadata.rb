name             'w_percona'
maintainer       'Joel Handwell'
maintainer_email 'joelhandwell@gmail.com'
license          'apachev2'
description      'Installs/Configures w_percona'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.2'

depends 'percona'
depends 'firewall'
depends 'xinetd'