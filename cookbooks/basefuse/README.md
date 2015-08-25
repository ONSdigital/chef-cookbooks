Introduction
------------

The [Chef](https://www.chef.io/) **basefuse** cookbook is a general-purpose cookbook that installs the [JBoss Fuse](http://www.jboss.org/products/fuse/overview/) Enterprise Service Bus.

Attributes
----------

This cookbook declares the attributes listed in the table below in `attributes/default.rb`:

|Key|Type|Description|
|---|----|-----------|
|basefuse::fuse\_archive|String|The file name of the Fuse software distribution|
|basefuse::fuse\_archive\_dir|String|The name of the directory containing the Fuse software distribution on the File Store Server|
|basefuse::fuse\_install\_root|String|The root directory of the Fuse installation|
|basefuse::fuse\_install\_dir|String|The directory where Fuse should be installed|
|basefuse::maven\_repository\_dir|String|The local Maven repository directory|
|basefuse::maven\_snapshot\_dir|String|The Maven directory on the File Store Server containing a snapshot of the Maven repository|
|basefuse::fuse\_user|String|The name of the operating system account Fuse will run under|
|basefuse::fuse\_user\_home|String|The path to the Fuse user's home directory|
|basefuse::fuse\_user\_process\_limit|String|The maximum number of processes the Fuse user can run|
|basefuse::custom\_packages|Array|Any packages that should be added to the Fuse runtime classpath|
|basefuse::fabric::command\_script|String|The script on the File Store Server used to build the bare Fuse Fabric|
|basefuse::fabric::openwire\_port|Integer|The OpenWire port used to communicate with this Fuse Fabric from the Process zone Fuse Fabric|

Recipes
-------

This cookbook includes the recipes listed in the table below. Recipes are executed in the order they are listed.

|Recipe|Description|
|------|-----------|
|default|Default recipe|
|baseos|Runs the `baseos` cookbook default recipe|
|basefuse::create\_fuse\_user|Creates an operating system account for the Fuse service to run under|
|basefuse::create\_fuse\_group|Creates an operating system group and makes the Fuse user created in the `create_fuse_user` recipe a member of it|
|basefuse::unzip\_fuse\_distro|Downloads the Fuse distribution from the [File Store Server](File Store Server "wikilink") and unzips it|
|basefuse::configure\_karaf\_config\_properties|Adds any required custom packages to the Fuse runtime classpath|
|basefuse::create\_maven\_repository|Creates the bare local Maven repository used by Fuse|
|basefuse::create\_fabric\_admin\_user|Creates the Fuse `users.properties` file that defines the users who can log in to the Fuse Fabric|
|basefuse::create\_fuse\_service\_wrapper|Creates the wrapper file used to run the Fuse service|
|basefuse::install\_fuse\_service|Enables and starts the Fuse service|
|basefuse::update\_selinux\_policy|Creates an SELinux policy exemption for the OpenWire port|
|basefuse::copy\_maven\_repository|Downloads a compressed copy of the Maven repository to use as the local repository|
|basefuse::create\_fabric|Creates the bare Fuse Fabric|

Templates
---------

This cookbook includes the templates listed in the table below:

|Template|Output File|Description|
|--------|-----------|-----------|
|default/config.properties.erb|/opt/fuse/jboss-fuse-6.1.0.redhat-379/etc/config.properties|Custom Karaf properties|
|default/settings.xml.erb|/opt/fuse/m2/settings.xml|Maven local repository settings|
|default/users.properties.erb|/opt/fuse/jboss-fuse-6.1.0.redhat-379/etc/users.properties|Fuse Fabric users|
|rhel/bash\_profile.erb|/home/fuse/.bash\_profile|Bash profile for the Fuse user operating system account|
