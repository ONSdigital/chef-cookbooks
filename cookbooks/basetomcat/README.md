Introduction
------------

The [Chef](https://www.chef.io/) **basetomcat** cookbook is a general-purpose cookbook that installs the [Apache Tomcat](http://tomcat.apache.org/) web server.

Attributes
----------

This cookbook declares the attributes listed in the table below in `attributes/default.rb`:

|Key|Type|Description|
|---|----|-----------|
|basetomcat::connector\_port|String|The port the Tomcat server will listen on|
|basetomcat::packages|Hash|Operating system packages to be installed|

Recipes
-------

This cookbook includes the recipes listed in the table below. Recipes are executed in the order they are listed.

|Recipe|Description|
|------|-----------|
|default|Default recipe|
|baseos|Runs the `baseos` cookbook default recipe|
|basejava|Runs the `basejava` cookbook default recipe|
|basetomcat::install\_packages|Installs the operating system packages specified by the `packages` attribute above|
|basetomcat::update\_selinux\_policy|Creates an SELinux policy exemption for the connector port|
|basetomcat::create\_tomcat\_server\_config|Creates the Tomcat server configuration file|
|basetomcat::create\_tomcat\_users\_config|Creates the Tomcat realm and users configuration file|
|basetomcat::enable\_service|Enables and starts the Tomcat operating system service|

Templates
---------

This cookbook includes the templates listed in the table below:

|Template|Output File|Description|
|--------|-----------|-----------|
|default/server.xml.erb|/etc/tomcat/server.xml|Tomcat server configuration|
|default/tomcat-users.xml.erb|/etc/tomcat/tomcat-users.xml|Tomcat realm and users configuration|
