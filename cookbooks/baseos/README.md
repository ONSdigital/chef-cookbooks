Introduction
------------

The [Chef](https://www.chef.io/) **baseos** cookbook is a general-purpose cookbook that installs base operating system packages and configures the locale and timezone.

Attributes
----------

This cookbook declares the attributes listed in the table below in `attributes/default.rb`:

|Key|Type|Description|
|---|----|-----------|
|baseos
  credentials\_data\_bag\_node|String|The name of the Chef [encrypted data bag](https://docs.chef.io/data_bags.html) containing various credentials used by other cookbooks|
|baseos
  filestore
    host|String|The IP address of the File Store Server|
|baseos
  filestore
    port|String|The HTTP port the File Store Server listens on|
|baseos
  packages|Hash|Operating system packages to be installed|

Recipes
-------

This cookbook includes the recipes listed in the table below. Recipes are executed in the order they are listed.

|Recipe|Description|
|------|-----------|
|default|Default recipe|
|baseos::update\_hosts|Recreates the operating system's `/etc/hosts` file using the `hosts.erb` template below|
|baseos::update\_locale|Sets the operating system locale to that specified by the `i18n.erb` template below|
|baseos::install\_packages|Installs the operating system packages specified by the `packages` attribute above|
|chef-client::delete\_validation|Deletes the validation certificate (`/etc/chef/validation.pem`) after the Chef client has been validated and authorized to connect to the Chef server|

Templates
---------

This cookbook includes the templates listed in the table below:

|Template|Output File|Description|
|--------|-----------|-----------|
|rhel/hosts.erb|/etc/hosts|Hosts file containing entries for the File Store Server and the current node|
|rhel/i18n.erb|/etc/sysconfig/i18n|System locale file; sets the locale to `en_GB.UTF-8`|
