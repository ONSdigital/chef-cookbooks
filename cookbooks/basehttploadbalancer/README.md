Introduction
------------

The [Chef] **basehttploadbalancer** cookbook is a general-purpose cookbook that installs and configures [NGINX] as an HTTP load balancer.

Attributes
----------

This cookbook declares the attributes listed in the table below in `attributes/default.rb`:

|Key|Type|Description|
|---|----|-----------|
| basehttploadbalancer::balancing_method | String | The load-balancing method to use. Valid values are `ip_hash` (the client's IP address is used as a hashing key) or `least_conn` (least-connected). If not specified then the default round-robin method is used |
| basehttploadbalancer::cluster_name | String | The name of the load-balancing cluster as it will be accessed over HTTP |
| basehttploadbalancer::origin_servers | Array | An array of origin server IP addresses that are part of the load-balancing cluster |

Recipes
-------

This cookbook includes the recipes listed in the table below. Recipes are executed in the order they are listed.

|Recipe|Description|
|------|-----------|
| default                                              | Default recipe                                                                                                              |
| basenginx                                            | Runs the `basenginx` cookbook default recipe                                                                                |
| basehttploadbalancer::create\_load\_balancer\_config | Creates the NGINX load-balancer configuration file                                                                          |
| basehttploadbalancer::delete\_default\_config        | Deletes the default NGINX configuration file so it doesn't conflict with the load-balancer configuration file created above |

Templates
---------

This cookbook includes the templates listed in the table below:

|Template|Output File|Description|
|--------|-----------|-----------|
| rhel/load-balancer-conf.erb | /etc/nginx/conf.d/load-balancer.conf | NGINX load-balancer configuration |

  [Chef]: https://www.chef.io/
  [NGINX]: http://nginx.org/
