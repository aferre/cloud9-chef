name             "cloud9"
maintainer       "Adrien Ferré"
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
