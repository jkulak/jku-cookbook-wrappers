name             'jku-cookbook-wrappers'
maintainer       'Jakub Kułak'
maintainer_email 'jakub.kulak@gmail.com'
license          'All rights reserved'
description      'Wrappers for most commonly used community cookbooks'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.3'

depends 'apache2', '~> 3.2.2'
depends 'php', '~> 1.10.1'
depends 'jku-common', '~> 0.1.1'
depends 'locale', '~> 1.1.0'
# depends 'mongodb3', '~> 5.3.0'
# depends 'mongodb', '~> 0.16.3', git: "https://github.com/chef-brigade/mongodb-cookbook"
depends "mysql2_chef_gem", "~> 1.1.0"
depends "database", "~> 5.1.2"
depends "mysql", "~> 8.0.2"
depends 'nodejs', '~> 2.4.4'
