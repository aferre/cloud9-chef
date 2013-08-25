Cloud9 Cookbook
===============

[![Build Status](https://travis-ci.org/aferre/cloud9-chef.png?branch=master)](https://travis-ci.org/aferre/cloud9-chef)
[![Bitdeli Badge](https://d2weczhvl823v0.cloudfront.net/aferre/cloud9-chef/trend.png)](https://bitdeli.com/free "Bitdeli Badge")

Installs/Configures cloud9

Requirements
------------

### Platform:

* Debian
* Ubuntu

### Cookbooks:

* nvm
* apt

Attributes
----------

<table>
  <tr>
    <td>Attribute</td>
    <td>Description</td>
    <td>Default</td>
  </tr>
  <tr>
    <td><code>node['cloud9']['directory']</code></td>
    <td>The directory containing cloud9 sources</td>
    <td><code>/home/vagrant/cloud9</code></td>
  </tr>
  <tr>
    <td><code>node['cloud9']['repository']</code></td>
    <td>The git repository containing cloud9 sources</td>
    <td><code>https://github.com/ajaxorg/cloud9.git</code></td>
  </tr>
  <tr>
    <td><code>node['cloud9']['reference']</code></td>
    <td>The commit which should be checked out when cloning the cloud9 sources</td>
    <td><code>ab693862647cbeb216734f795745e4c564258110</code></td>
  </tr>
  <tr>
    <td><code>node['cloud9']['revision']</code></td>
    <td>The branch name or tag which should be checked out when cloning the cloud9 sources</td>
    <td><code>v2.0.93</code></td>
  </tr>
  <tr>
    <td><code>node['cloud9']['user']</code></td>
    <td>The user installing cloud9</td>
    <td><code>vagrant</code></td>
  </tr>
  <tr>
    <td><code>node['cloud9']['nvm']['version']</code></td>
    <td>The node version installed by nvm</td>
    <td><code>v0.8.25</code></td>
  </tr>
  <tr>
    <td><code>node['cloud9']['test-repo']</code></td>
    <td>The sources of the cloud9 cookbook, used to provide a simple example when provisionning a machine</td>
    <td><code>/home/vagrant/chef-cloud9</code></td>
  </tr>
  <tr>
    <td><code>node['cloud9']['repo']['repository']</code></td>
    <td>The sources of the cloud9 cookbook, used to provide a simple example when provisionning a machine</td>
    <td><code>https://github.com/aferre/cloud9-chef.git</code></td>
  </tr>
  <tr>
    <td><code>node['cloud9']['repo']['directory']</code></td>
    <td>The directory to clone the sources of the cloud9 cookbook into</td>
    <td><code>/home/vagrant/chef-cloud9</code></td>
  </tr>
</table>

Recipes
-------

*No recipes defined*

License and Author
------------------

Author:: Adrien Ferre (<ferre.adrien@gmail.com>)

Copyright:: 2013, Adrien Ferre

License:: Apache 2.0
