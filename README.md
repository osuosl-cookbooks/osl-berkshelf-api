osl-berkshelf-api Cookbook
==========================

This cookbook tweaks the <code>berkshelf-api-server</code> cookbook slightly through the use of the <code>chef-rewind</code> gem, along with any other extra customizations the OSL makes.

Requirements
------------

  * <code>berkshelf-api-server</code> - cookbook

Attributes
----------

None
Usage
-----
#### osl-berkshelf-api::default

Just include `osl-berkshelf-api` in your node's `run_list`:

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[osl-berkshelf-api]"
  ]
}
```
