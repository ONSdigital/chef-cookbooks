Introduction
------------

The [Chef](https://www.chef.io/) **basemongodb** cookbook is a general-purpose cookbook that installs the [MongoDB](http://www.mongodb.org/) document database server. Note that this cookbook wraps the [mongodb](https://supermarket.chef.io/cookbooks/mongodb) Chef community cookbook.

Attributes
----------

This cookbook declares the attributes listed in the table below in `attributes/default.rb`:

|Key|Type|Description|
|---|----|-----------|
|mongodb
  install\_method|String|Where to get the MongoDB package from. Note that `mongodb-org` must be specified for CentOS|

Recipes
-------

This cookbook includes the recipes listed in the table below. Recipes are executed in the order they are listed.

|Recipe|Description|
|------|-----------|
|default|Default recipe|
|baseos|Runs the `baseos` cookbook default recipe|
|mongodb::default|Installs MongoDB|

Templates
---------

This cookbook doesn't include any templates.
