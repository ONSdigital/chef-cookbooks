Introduction
------------

The [Chef] **baseapache** cookbook is a general-purpose cookbook that installs the [Apache 2] web server.

Attributes
----------

This cookbook declares the attributes listed in the table below in `attributes/default.rb`:

| Key            | Type   | Description                                  |
|----------------|--------|----------------------------------------------|
| baseapache
   documentroot  | String | The location of the web server document root |
| baseapache
   packages      | Hash   | Operating system packages to be installed    |

Recipes
-------

This cookbook includes the recipes listed in the table below. Recipes are executed in the order they are listed.

| Recipe                                        | Description                                                                        |
|-----------------------------------------------|------------------------------------------------------------------------------------|
| default                                       | Default recipe                                                                     |
| baseos                                        | Runs the `baseos` cookbook default recipe                                          |
| baseapache::install\_packages                 | Installs the operating system packages specified by the `packages` attribute above |
| baseapache::update\_apache\_group\_membership | Adds the `apache` user to the `apache` operating system group                      |
| baseapache::install\_apache\_service          | Enables and starts the `httpd` operating system service                            |

Templates
---------

This cookbook doesn't include any templates.

  [Chef]: https://www.chef.io/
  [Apache 2]: http://httpd.apache.org/
