Introduction
------------

The [Chef](https://www.chef.io/) **basejava** cookbook is a general-purpose cookbook that installs the [OpenJDK](http://openjdk.java.net/) Java Development Kit.

Attributes
----------

This cookbook declares the attributes listed in the table below in `attributes/default.rb`:

|Key|Type|Description|
|---|----|-----------|
|basejava::packages|Hash|Operating system packages to be installed|

Recipes
-------

This cookbook includes the recipes listed in the table below. Recipes are executed in the order they are listed.

|Recipe|Description|
|------|-----------|
|default|Default recipe|
|baseos|Runs the `baseos` cookbook default recipe|
|install\_packages|Installs the operating system packages specified by the `packages` attribute above|

Templates
---------

This cookbook doesn't include any templates.
