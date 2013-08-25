name             "cloud9"
maintainer       "Adrien Ferre"
maintainer_email "ferre.adrien@gmail.com"
license          "Apache 2.0"
description      "Installs/Configures cloud9"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1"

%w{ debian ubuntu }.each do |os|
  supports os
end

depends "nvm"
depends "apt"

attribute "cloud9/directory",
  :display_name => "Cloud9 Base Path",
  :description => "The directory containing cloud9 sources",
  :default => "/home/vagrant/cloud9",
  :recipes => ["cloud9"]

attribute "cloud9/repository",
  :display_name => "Cloud9 repository",
  :description => "The git repository containing cloud9 sources",
  :default => "https://github.com/ajaxorg/cloud9.git",
  :recipes => ["cloud9"]

attribute "cloud9/reference",
  :display_name => "Cloud9 repository commit ",
  :description => "The commit which should be checked out when cloning the cloud9 sources",
  :default => "ab693862647cbeb216734f795745e4c564258110",
  :recipes => ["cloud9"]

attribute "cloud9/revision",
  :display_name => "Cloud9 repository branch/tag",
  :description => "The branch name or tag which should be checked out when cloning the cloud9 sources",
  :default => "v2.0.93",
  :recipes => ["cloud9"]

attribute "cloud9/user",
  :display_name => "Cloud9 user",
  :description => "The user installing cloud9",
  :default => "vagrant",
  :recipes => ["cloud9"]

attribute "cloud9/nvm/version",
  :display_name => "Node version",
  :description => "The node version installed by nvm",
  :default => "v0.8.25",
  :recipes => ["cloud9"]

attribute "cloud9/test-repo",
  :display_name => "Cloud9 cookbook repository",
  :description => "The sources of the cloud9 cookbook, used to provide a simple example when provisionning a machine",
  :default => "/home/vagrant/chef-cloud9",
  :recipes => ["cloud9"]

attribute "cloud9/repo/repository",
  :display_name => "Cloud9 cookbook repository",
  :description => "The sources of the cloud9 cookbook, used to provide a simple example when provisionning a machine",
  :default => "https://github.com/aferre/cloud9-chef.git",
  :recipes => ["cloud9"]
  
attribute "cloud9/repo/directory",
  :display_name => "Cloud9 cookbook directory",
  :description => "The directory to clone the sources of the cloud9 cookbook into",
  :default => "/home/vagrant/chef-cloud9",
  :recipes => ["cloud9"]