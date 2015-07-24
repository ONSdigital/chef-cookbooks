Description
===========
Installs and configures PostgreSQL using the EnterpriseDB installer in unattended mode. Additionally:
* Configures for hotbackups and schedules on the cron
* Creates a .psqlrc with some utility alias queries
* Inserts some utility scripts into a DBA directory that assist in the creation of databases and users etc...

Requirements
============

## Platforms

* Red Hat/Centos/Fedora

Tested on:

* Centos 6.5

ToDo
====
* Add support for Debian/Ubuntu and test.

Attributes
==========
See the `attributes/default.rb` file for default values.

System level parameters
-----------------------
* `node['postgresql']['version']` - Major version of PostgreSQL to manage.
* `node['postgresql']['port']` - Port PostgreSQL will listen on.
* `node['postgresql']['pguser']` - User PostgreSQL will be installed as.
* `node['postgresql']['bkuser]` - PostgreSQL backup user with replication privs.
* `node['postgresql']['bin_mount']` - Location of the PostgreSQL binaries.
* `node['postgresql']['data_mount']` - Location of the PostgreSQL data dir.
* `node['postgresql']['bak_mount']` - Location of the PostgreSQL backups.
* `node['postgresql']['pg_media']` - Name of installation executable.

Configuration parameters
------------------------
The `postgresql.conf` file is dynamically generated from the attributes in the `attributes/default.rb` file. Edit these to ensure the desired database parameteres are set.

Usage
=====
Just include `otspostgresql` in your node's `run_list`:

License and Author
==================
- Author:: Steve Bennett (<smbennett1974@gmail.com>)

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
