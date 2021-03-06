Introduction
------------

The [Chef](https://www.chef.io/) **baseruby** cookbook is a general-purpose cookbook that installs the [Ruby](https://www.ruby-lang.org/en/) programming language.

Attributes
----------

This cookbook declares the attributes listed in the table below in `attributes/default.rb`:

|Key|Type|Description|
|---|----|-----------|
|baseruby::ruby\_version|String|The version of Ruby to install|
|baseruby::ruby\_install\_dir|String|The root of the Ruby installation directory|
|baseruby::ruby\_gems\_updated|String|Attribute guard that indicates whether the RubyGems package manager has been updated or not|
|baseruby::packages|Hash|Operating system packages to be installed|

Recipes
-------

This cookbook includes the recipes listed in the table below. Recipes are executed in the order they are listed.

|Recipe|Description|
|------|-----------|
|default|Default recipe|
|baseos|Runs the `baseos` cookbook default recipe|
|baseruby::install\_development\_tools|Installs the development tools required to compile Ruby|
|baseruby::install\_packages|Installs the operating system packages specified by the `packages` attribute above|
|baseruby::install\_ruby\_build|Installs the [`ruby-build`](https://github.com/sstephenson/ruby-build) command for installing Ruby versions|
|baseruby::install\_ruby|Uses the `ruby-build` command to install the specified version of Ruby|
|baseruby::update\_ruby\_gems\_system|Updates the RubyGems package manager to the latest version|
|baseruby::install\_bundler|Installs the [`Bundler`](http://bundler.io/) RubyGem|
|baseruby::install\_rubocop|Installs the [`RuboCop`](https://github.com/bbatsov/rubocop) RubyGem for development environments only|
|baseruby::install\_geminabox|Installs the [`Gem in a Box`](https://github.com/geminabox/geminabox) RubyGem for development environments only|

Templates
---------

This cookbook doesn't include any templates.
