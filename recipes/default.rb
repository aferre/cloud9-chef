#
# Cookbook Name:: cloud9
# Recipe:: default
#
# Copyright 2013, Example Com
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# 
#     http://www.apache.org/licenses/LICENSE-2.0
# 
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe 'apt'
include_recipe 'nvm'

execute "apt-get-update" do
  command "apt-get update"
  ignore_failure false
  action :run
end

  # packages.each do |pkg|
  #   package pkg do
  #     action [:install, :upgrade]
  #   end
  # end

  # package 'libxml2-dev'
  # package 'apache2-utils'
  # package 'libssl-dev'

%w{libxml2-dev apache2-utils libssl-dev}.each do |pkg|
  package pkg do
    action [:install, :upgrade]
  end
end

nvm_install node['cloud9']['nvm']['version']  do
    from_source node['nvm']['install_from_sources']
    alias_as_default node['nvm']['alias_as_default']
    action :create
    notifies :run, "bash[install_sourcemint]"
end

bash "install_sourcemint" do
	code <<-EOH
  #{node['nvm']['source']}
  nvm use #{node['cloud9']['nvm']['version']}
  npm install -g sm
  #{node['nvm']['directory']}/#{node['cloud9']['nvm']['version']}/lib/node_modules/sm/bin/sm install-command
  EOH
	ignore_failure false
	action :nothing
end

git node['cloud9']['directory'] do
  repository node['cloud9']['repository']
  revision node['cloud9']['revision']
  ignore_failure false
  action :sync
  notifies :run, "bash[install_cloud9]"
end


bash "install_cloud9" do
   code <<-EOH
  #{node['nvm']['source']}
  nvm use #{node['cloud9']['nvm']['version']}
  #{node['nvm']['directory']}/#{node['cloud9']['nvm']['version']}/lib/node_modules/sm/bin/sm install
  EOH
  cwd "#{node['cloud9']['directory']}"
  ignore_failure false
  action :nothing
retries 2
end

