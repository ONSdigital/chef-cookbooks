Introduction
------------

The [Chef](https://www.chef.io/) **basepassenger** cookbook is a general-purpose cookbook that installs the [Phusion Passenger](https://www.phusionpassenger.com/) web server.

Attributes
----------

This cookbook declares the attributes listed in the table below in `attributes/default.rb`:

|Key|Type|Description|
|---|----|-----------|
|basepassenger::passenger\_version|String|The version of Phusion Passenger to install|
|basepassenger::packages|Hash|Operating system packages to be installed|

Recipes
-------

This cookbook includes the recipes listed in the table below. Recipes are executed in the order they are listed.

|Recipe|Description|
|------|-----------|
|default|Default recipe|
|baseruby|Installs the [Ruby](https://www.ruby-lang.org/en/) programming language|
|baseapache|Installs the [Apache 2](http://httpd.apache.org/) web server|
|basepassenger::install\_packages|Installs the operating system packages specified by the `packages` attribute above|
|basepassenger::install\_passenger\_ruby\_gem|Installs the Phusion Passenger RubyGem|
|basepassenger::install\_passenger\_apache\_module|Installs the Phusion Passenger Apache 2 module|
|basepassnger::create\_passenger\_apache\_module\_config|Creates the Phusion Passenger Apache 2 module configuration file and restarts the `httpd` service|

Templates
---------

This cookbook includes the templates listed in the table below:

|Template|Output File|Description|
|--------|-----------|-----------|
|default/passenger.conf.erb|/etc/httpd/conf.modules.d/00-passenger.conf|Phusion Passenger Apache 2 module configuration|
