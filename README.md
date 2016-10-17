# jku-cookbook-wrappers Cookbook

Set of wrapper recipes for community cookbooks.

## Components

* Ubuntu 14.04.3 LTS (Vagrant box)
* Apache/2.4.7 (Ubuntu)
* PHP 5.5.9-1ubuntu4.11
* MySQL 5.6.19-0ubuntu0.14.04.1

# Component details

## Varnish

Configuration files:
* `/etc/varnish/custom_default.vcl`
* `/etc/default/varnish`

Usage `/etc/init.d/varnish {start|stop|restart|reload|force-reload|configtest}`

## Apache

Usage `/etc/init.d/apache2 {start|stop|graceful-stop|restart|reload|force-reload|start-htcacheclean|stop-htcacheclean}`

## MySQL

The service name on the OS is mysql-master.

Files location
* configuration: `/etc/mysql-master/my.cnf`
* socket: `/var/run/mysql-master/mysqld.sock`
* error log: `/var/log/mysql-master/error.log`

Connect to server using mysql client
* `$ mysql -u root -p -h 127.0.0.1`
* `$ mysql -u root -p --socket /var/run/mysql-master/mysqld.sock`

Usage `sudo service mysql-master start|stop|restart|reload|force-reload|status`

## MongoDB

Version: 2.4.9

Files location
* service: `/etc/init/mongodb.conf`
* configuration: `/etc/mongodb.conf`
* log: `/var/log/mongodb/mongodb.log`

Usage `sudo service mongodb start|stop|status`

Connect to server using mongo client
* `$ mongo`

Role "root" doesn't exist in MongoDB < 3.

# Hacks

Hacks and custom implementation that is waiting for issues to be fixed

* apache2::mod_pagespeed won't install, giving
```ERROR: package[mod_pagespeed] (apache2::mod_pagespeed line 27) had an error: Chef::Exceptions::Package: apt package provider cannot handle source attribute. Use dpkg provider instead
```
Waiting to be tested ad merged: https://github.com/svanzoest-cookbooks/apache2/pull/248


# TODOs

- [ ] Set up nodejs app properly: https://www.digitalocean.com/community/tutorials/how-to-set-up-a-node-js-application-for-production-on-ubuntu-14-04
- [ ] Make MySQL work
- [ ] Switch to MongoDB 3
- [x] Fix naming jku-kosiarka & jku-multipurpose

## role::webserver

- [ ] Lock websites with .htpasswd with data from encrypted data_bags
- [ ] Allow for CRON configuration (https://supermarket.getchef.com/cookbooks/cron)
- [ ] Configure logrotate
- [ ] Install Nagios
- [ ] Install iptables and openssh (http://chrislaco.com/devops-toolbox/customizing-recipes-for-our-application/)
- [ ] Install https://supermarket.getchef.com/cookbooks/sanitize
- [ ] Install fail2ban
- [ ] Add ServerName in /etc/apache2/apache2.conf to get rid of “AH00558: apache2: Could not reliably determine the server’s fully qualified domain name, using 127.0.1.1. Set the ‘ServerName’ directive globally to suppress this message”
- [ ] Performance: read and apply: https://httpd.apache.org/docs/trunk/misc/perf-tuning.html
- [ ] Configure Varnish 4 accordingly to app needs (custom_default.vcl.erb)
- [ ] Use https://github.com/drpebcak/mod_pagespeed_cookbook for mod_pagespeed

## role::deployment

- [ ] Bulletproof Strider deployment scripts (non existing directories)

## jku-stridercd

- [ ] Make the cookbook independent (install MongoDB if not installed, install Git, nodejs and node-gyp)
- [ ] Add Bitbucket support
- [ ] Publish as a separate cookbook (it’s a part of kitchen-kosiarka now)

## jku-mysql

- [ ] In jku-database::mysql_server create users and import dumps in loops (iterate from config files)

## Performance testing

- [ ] Debug mysql problems under higher pressure (for Magneto)
- [ ] Install Nginx
- [ ] Install php-fpm for Nginx
- [ ] Install HHVM for Nginx
- [ ] Figure out, how to test PHP perforance (independent from database). I would need something that is PHP heavy. Drupal? HHBD?
- [ ] Instal module for random content for WordPress (https://wordpress.org/plugins/random-content/)
- [ ] Export db with WordPress content for testing purposes
- [ ] Prepare performance testing environment
- tests are done on remote server
- tests are done with installed Drupal/Wordpress (requires DB)
- tests are done with PHP for loop
- Performance
	- ab -k -c 50 -n 100000 http://192.168.0.61/hello.php
	- siege278 -b -q -c 10 -r 100 -f wordpress.urls
	- GooglePage Speed

# Done

## 2015-10-26

- [x] Move cookbooks to separate repositories

## Earlier

- [x] Install Google PageSpeed module: https://developers.google.com/speed/pagespeed/module/download
- [x] Add users from data_bag
- [x] Allow for sudo for users
- [x] Install MongoDB
- [x] Create stridercd cookbook
- [x] Install composer
- [x] Move configuration from config.json to environments
- [x] Start/stop mysql server
- [x] Install WordPress for performance testing purposes
- [x] Figure our why after second provisioning, user doesn’t have access to the database (is he connecting for localhost instead of 127.0.0.1?)
	- database cookbook is not udpating privileges after only password got changed: https://github.com/chef-cookbooks/database/issues/181
- [x] Make WordPress recipe read configuration from environment files
- [x] In jku-database::mysql_server create database servers in a loop (iterate from config files)
- [x] Move version_dir_structure to definitions
- [x] Figure out why, Wordpress tries to install MySQL 5.5? (A: First set attributes, then include recipe to be executed)
- [x] Clean up vhosts/urls for custom apps and apps from recipes (perftest vs. wordpress)
- [x] Include bench.php in PHP performance tests
- [x] Describe what configurations to test
	- Nginx + HHVM
	- Apache2.4 + mod_php + opcache (built in since PHP5.5)
	- Nginx + php_fpm
	- Apache2.4 + mod_php (no opcache)
- [x] Install Varnish4
- [x] Proper probe backend servers (Apache local host)
- [x] Upload custom configuration template from: https://github.com/mattiasgeniar/varnish-4.0-configuration-templates
- [x] Prepare directory structure for Strider deployments
- [x] Replace static values from jku-local/attributes/wordpress.rb with node[‘mysql’] values (also include mysql recipe?)
