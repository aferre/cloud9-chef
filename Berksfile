site :opscode

metadata
cookbook 'nvm', git: 'git://github.com/aferre/nvm.git'

group :integration do
  cookbook 'nvm', git: 'git://github.com/aferre/nvm.git'
  cookbook "apt"
  cookbook "yum"
  cookbook "minitest-handler"
  cookbook "cloud9_test", :path => "./test/cookbooks/cloud9_test"
end
