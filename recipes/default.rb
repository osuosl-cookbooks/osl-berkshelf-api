#
# Cookbook Name:: osl-berkshelf-api
# Recipe:: default
#
# Copyright 2014, Oregon State University
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

include_recipe 'berkshelf-api-server'

# The rewind gem allows us to change or undo resources from another
# cookbook without modifying the cookbook.
chef_gem 'chef-rewind'
require 'chef/rewind'

# Undo berkshelf-api config so that we can properly wrap
# sensitive information in a data bag and template it out.
unwind "file[#{node['berkshelf_api']['config_path']}]"

keys =  Chef::EncryptedDataBagItem.load('osl-berkshelf-api','keys')

template node['berkshelf_api']['config_path'] do
  source 'berkshelf-api.conf.erb'
  variables :keys => keys
  owner "root"
  group "root"
  mode 0600
end
