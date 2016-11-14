Introduction
------------

The [Chef](https://www.chef.io/) **baseredis** cookbook is a general-purpose cookbook that installs the [Redis](http://redis.io/) in-memory data structure store.

Attributes
----------

This cookbook declares the attributes listed in the table below in `attributes/default.rb`:

|Key|Type|Description|
|---|----|-----------|
|baseredis::bind|String|The network interface IP addresses Redis should listen for connections on|
|baseredis::packages|Hash|Operating system packages to be installed|

Recipes
-------

This cookbook includes the recipes listed in the table below. Recipes are executed in the order they are listed.

|Recipe|Description|
|------|-----------|
|default|Default recipe|
|baseos|Runs the `baseos` cookbook default recipe|
|baseredis::update\_overcommit\_memory|Sets the Linux kernel overcommit memory to the Redis recommended setting|
|baseredis::update\_somaxconn|Sets the TCP backlog setting to the Redis recommended setting|
|baseredis::disable\_transparent\_huge\_pages|Disables transparent huge pages in the Linux kernel|
|baseredis::install\_packages|Installs the operating system packages specified by the `packages` attribute above|
|baseredis::create\_redis\_config|Creates the Redis configuration file|
|baseredis::install\_redis\_service|Enables and starts the `redis` operating system service|

Templates
---------

This cookbook includes the templates listed in the table below:

|Template|Output File|Description|
|--------|-----------|-----------|
|default/redis.conf.erb|/etc/redis.conf|Redis configuration|
|rhel/rc.local.erb|/etc/rc.d/rc.local|Commands to run during system boot|
|rhel/sysctl.conf.erb|/etc/sysctl.conf|Kernel parameters configuration file|
