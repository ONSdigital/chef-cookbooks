# ONS Base Chef Cookbooks
This repository contains general purpose [Chef](http://chef.io/) cookbooks that are non-project specific and thus potentially suitable for use on any development project.
Please note that these cookbooks and recipes are very much a work in progress and may not be immediately ready for reuse without further work.

## Supported Operating Systems
The cookbooks and recipes have all been developed for [RHEL](http://www.redhat.com/en/technologies/linux-platforms/enterprise-linux)-based Linux distributions. Note that they
have only been tested and used for real on [CentOS 7](https://www.centos.org/).

## Cookbooks
This repository contains the cookbooks detailed below:

| Cookbook             | Purpose                                                                                        |
| -------------------- | ---------------------------------------------------------------------------------------------- |
| baseapache           | Installs the [Apache 2](http://httpd.apache.org/) web server                                   |
| baseos               | Installs base operating system packages and configures the locale and timezone                 |
| basefuse             | Installs the [JBoss Fuse](http://www.jboss.org/products/fuse/overview/) Enterprise Service Bus |
| basehttploadbalancer | Installs and configures [NGINX](http://nginx.org/) as an HTTP load balancer                    |
| basejava             | Installs the [OpenJDK](http://openjdk.java.net/) Java Development Kit                          |
| basemongodb          | Installs the [MongoDB](http://www.mongodb.org/) document database server                       |
| basenginx            | Installs the [NGINX](http://nginx.org/) web server                                             |
| baseopenldap         | Installs the [OpenLDAP](http://www.openldap.org/) server                                       |
| basepassenger        | Installs the [Phusion Passenger](https://www.phusionpassenger.com/) web server                 |
| basepostgresql       | Installs the [PostgreSQL](http://www.postgresql.org/) relational database server               |
| baseredis            | Installs the [Redis](http://redis.io/) in-memory data structure store                          |
| baseruby             | Installs the [Ruby](https://www.ruby-lang.org/en/) programming language                        |
| baseservicemix       | Installs the [Apache ServiceMix](http://servicemix.apache.org/) integration container          |
| basetomcat           | Installs the [Apache Tomcat](http://tomcat.apache.org/) web server                             |
