Introduction
------------

The [Chef] **baseopenldap** cookbook is a general-purpose cookbook that installs [OpenLDAP].

Attributes
----------

This cookbook declares the attributes listed in the table below in `attributes/default.rb`:

|Key|Type|Description|
|---|----|-----------|
| baseopenldap::packages | Hash | Operating system packages to be installed |

Recipes
-------

This cookbook includes the recipes listed in the table below. Recipes are executed in the order they are listed.

|Recipe|Description|
|------|-----------|
| default                                       | Default recipe                                                                     |
| baseos                                        | Runs the `baseos` cookbook default recipe                                          |
| basenopenldap::install\_packages              | Installs the operating system packages specified by the `packages` attribute above |
| baseopenldap::install\_openldap\_service      | Enables and starts the `slapd` operating system service                            |

Templates
---------

This cookbook doesn't include any templates.

  [Chef]: https://www.chef.io/
  [OpenLDAP]: http://openldap.org/
