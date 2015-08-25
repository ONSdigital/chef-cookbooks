Introduction
------------

The [Chef](https://www.chef.io/) **basepostgresql** cookbook is a general-purpose cookbook that installs the [PostgreSQL](http://www.postgresql.org/) relational database server. Note that this cookbook wraps the [postgresql](https://supermarket.chef.io/cookbooks/postgresql) Chef community cookbook.

Attributes
----------

This cookbook declares the attributes listed in the table below in `attributes/default.rb`:

|Key|Type|Description|
|---|----|-----------|
|basepostgresql::postgres\_user|String|The operating system user to run `psql` commands as|
|postgresql::password::postgres|String|The password for the `postgres` user|
|postgresql::enable\_pgdg\_yum|Boolean|Whether to enable the yum repo by the PostgreSQL Global Development Group (PGDG), which contains newer versions of PostgreSQL|
|postgresql::database\_name|String|The name of the default PostgreSQL database|
|postgresql::version|String|The version of PostgreSQL to install|
|postgresql::dir|String|The PostgreSQL data and configuration home directory|
|postgresql::client::packages|Array|An array of package names that should be installed on PostgreSQL client systems|
|postgresql::contrib::packages|Array|An array of package names that could be installed on PostgreSQL server systems for useful sysadmin tools|
|postgresql::server::packages|Array|An array of package names that should be installed on PostgreSQL server systems|
|postgresql::server::service\_name|String|The name of the operating system service to run PostgreSQL under|
|postgresql::config::data\_directory|String|The PostgreSQL data directory|
|postgresql::config::listen\_addresses|String|The TCP/IP address(es) on which PostgreSQL will listen for connections from client applications|
|postgresql::config::log\_timezone|String|The time zone used for timestamps written in the PostgreSQL server log|
|postgresql::config::lc\_messages|String|The language in which PostgreSQL messages are displayed|
|postgresql::config::lc\_monetary|String|The locale to use for formatting monetary amounts in PostgreSQL|
|postgresql::config::lc\_numeric|String|The locale to use for formatting numbers in PostgreSQL|
|postgresql::config::lc\_time|String|The locale to use for formatting dates and times in PostgreSQL|
|postgresql::contrib::extensions|Array|An array of PostgreSQL contrib module extensions|
|postgresql::pgdg::repo\_rpm\_url|Hash|Attributes to pick up recent PGDG packages|
|postgresql::pg\_hba|Array|An array of hashes containing authorisation data used to dynamically generate the `pg_hba.conf` file|

Recipes
-------

This cookbook includes the recipes listed in the table below. Recipes are executed in the order they are listed.

|Recipe|Description|
|------|-----------|
|default|Default recipe|
|baseos|Runs the `baseos` cookbook default recipe|
|postgresql::server|Installs the PostgreSQL server packages and manages the server configuration and operating system service|
|postgresql::contrib|Installs the PostgreSQL contrib packages|

Templates
---------

This cookbook doesn't include any templates.
