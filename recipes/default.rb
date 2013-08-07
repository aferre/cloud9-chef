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

# install nvm
include_recipe 'nvm'

execute "apt-get-update" do
  command "apt-get update"
  ignore_failure false
  action :run
end

# install node.js v0.10.5
nvm_install node['cloud9']['nvm']['version']  do
    from_source true
    alias_as_default true
    action :create
    notifies :run, "execute[install sourcemint]"
end

execute "install sourcemint" do
	command "nvm use #{node['cloud9']['nvm']['version']}; npm install -g sm"
	ignore_failure false
	action :nothing
end

git node['cloud9']['directory'] do
  repository node['cloud9']['repository']
  reference node['cloud9']['reference']
  action :sync
  notifies :run, "execute[install cloud9]"
end

execute "install cloud9" do
	cwd node['cloud9']['directory']
	command "sm install"
	ignore_failure false
	action :nothing
end
