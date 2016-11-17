Introduction
------------

The [Chef] **basenginx** cookbook is a general-purpose cookbook that installs the [NGINX] web server.

Attributes
----------

This cookbook declares the attributes listed in the table below in `attributes/default.rb`:

|Key|Type|Description|
|---|----|-----------|
| basenginx::packages | Hash | Operating system packages to be installed |

Recipes
-------

This cookbook includes the recipes listed in the table below. Recipes are executed in the order they are listed.

|Recipe|Description|
|------|-----------|
| default                                    | Default recipe                                                                     |
| baseos                                     | Runs the `baseos` cookbook default recipe                                          |
| basenginx::install\_nginx\_yum\_repository | Installs the NGINX yum repository                                                  |
| basenginx::install\_packages               | Installs the operating system packages specified by the `packages` attribute above |
| basenginx::install\_nginx\_service         | Enables and starts the `nginx` operating system service                            |

Templates
---------

This cookbook doesn't include any templates.

  [Chef]: https://www.chef.io/
  [NGINX]: http://nginx.org/
