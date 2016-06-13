name             'chef-gcd'
maintainer       'YOUR_COMPANY_NAME'
maintainer_email 'YOUR_EMAIL'
license          'All rights reserved'
description      'Installs/Configures chef-gcd'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.2'
depends 'chef-ingredient', '>= 0.18.0'
depends 'chef-server-ha-aws-provisioner'
