Introduction
------------

The [Chef](https://www.chef.io/) **baseservicemix** cookbook is a general-purpose cookbook that installs the [Apache ServiceMix](http://servicemix.apache.org/) integration container.

Attributes
----------

This cookbook declares the attributes listed in the table below in `attributes/default.rb`:

|Key|Type|Description|
|---|----|-----------|
|baseservicemix::servicemix\_archive|String|The file name of the ServiceMix software distribution|
|baseservicemix::servicemix\_archive\_dir|String|The name of the directory containing the ServiceMix software distribution on the File Store Server|
|baseservicemix::servicemix\_install\_root|String|The root directory of the ServiceMix installation|
|baseservicemix::servicemix\_install\_dir|String|The directory where ServiceMix should be installed|
|baseservicemix::maven\_repository\_dir|String|The local Maven repository directory|
|baseservicemix::servicemix\_user|String|The name of the operating system account ServiceMix will run under|
|baseservicemix::servicemix\_user\_home|String|The path to the ServiceMix user's home directory|
|baseservicemix::command\_script|String|The script on the File Store Server used to configure global ServiceMix properties|
|baseservicemix::openwire\_port|String|The OpenWire port used to communicate with ServiceMix's ActiveMQ broker from the Process zone's ActiveMQ broker|
|baseservicemix::properties\_configured|String|Whether the `configure_properties` recipe has configured various ServiceMix properties|
|baseservicemix::hawtio\_installed|String|Whether the `install_hawtio` recipe has installed the Hawtio web console|
|baseservicemix::hawtio\_version|String|The version of the Hawtio web console to install|

Recipes
-------

This cookbook includes the recipes listed in the table below. Recipes are executed in the order they are listed.

|Recipe|Description|
|------|-----------|
|default|Default recipe|
|basejava|Runs the `basejava` cookbook default recipe|
|baseservicemix::create\_servicemix\_user|Creates an operating system account for the ServiceMix service to run under|
|baseservicemix::create\_servicemix\_group|Creates an operating system group and makes the ServiceMix user created in the `create_servicemix_user` recipe a member of it|
|baseservicemix::unzip\_servicemix\_distro|Downloads the ServiceMix distribution from the File Store Server and unzips it|
|baseservicemix::update\_servicemix\_logger|Updates the ServiceMix logging settings so each bundle logs to a separate file|
|baseservicemix::update\_servicemix\_environment|Updates the ServiceMix environment settings file with the correct `JAVA_HOME` environment variable|
|baseservicemix::update\_servicemix\_activemq\_config|Updates the ServiceMix ActiveMQ configuration file with the OpenWire port|
|baseservicemix::create\_maven\_repository|Creates the bare local Maven repository used by ServiceMix|
|baseservicemix::create\_servicemix\_service\_wrapper|Creates the wrapper file used to run the ServiceMix service|
|baseservicemix::install\_servicemix\_service|Enables and starts the ServiceMix service|
|baseservicemix::configure\_properties|Configures global ServiceMix properties such as the Maven repository location and the ActiveMQ broker credentials|
|baseservicemix::update\_selinux\_policy|Creates an SELinux policy exemption for the OpenWire port|
|baseservicemix::update\_selinux\_policy|Creates an SELinux policy exemption for the OpenWire port|
|baseservicemix::install\_hawtio|Installs the Hawtio web console|

Templates
---------

This cookbook includes the templates listed in the table below:

|Template|Output File|Description|
|--------|-----------|-----------|
|default/activemq.xml.erb|/opt/servicemix/apache-servicemix-6.1.0/etc/activemq.xml|ActiveMQ settings|
|default/setenv.erb|/opt/servicemix/apache-servicemix-6.1.0/bin/setenv|ServiceMix environment settings|
|default/settings.xml.erb|/opt/servicemix/m2/settings.xml|Maven local repository settings|
|default/system.properties.erb|/opt/servicemix/apache-servicemix-6.1.0/etc/system.properties|Karaf system properties|
|rhel/bash\_profile.erb|/home/servicemix/.bash\_profile|Bash profile for the ServiceMix user operating system account|
