Introduction
------------

The [Chef](https://www.chef.io/) **basethin** cookbook is a general-purpose cookbook that installs the [Thin](http://code.macournoyer.com/thin/) web server.

Attributes
----------

This cookbook declares the attributes listed in the table below in `attributes/default.rb`:

|Key|Type|Description|
|---|----|-----------|
|basethin::config\_dir|String|The directory where Thin looks for web application configuration files|
|basethin::thin\_user|String|The name of the operating system account Thin will run under|
|basethin::thin\_user\_home|String|The path to the Thin user's home directory|

Recipes
-------

This cookbook includes the recipes listed in the table below. Recipes are executed in the order they are listed.

|Recipe|Description|
|------|-----------|
|default|Default recipe|
|baseruby|Installs the [Ruby](https://www.ruby-lang.org/en/) programming language|
|basethin::install\_thin\_ruby\_gem|Installs the Thin RubyGem|
|basethin::create\_thin\_user|Creates an operating system account for the Thin service to run under|
|basethin::install\_thin\_service|Installs, enables and starts the Thin service|

Templates
---------

This cookbook includes the templates listed in the table below:

|Template|Output File|Description|
|--------|-----------|-----------|
|default/thin\_init.erb|/etc/init.d/thin|Thin service init script|
