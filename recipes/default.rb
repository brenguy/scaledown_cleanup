#
# Cookbook Name:: scaledown_cleanup
# Recipe:: default
#
# Copyright 2015, Optaros
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
#


#Make default knife directory
directory "/root/.chef" do
  owner "root"
  group "root"
  mode 0775
  action :create
  not_if { File.exist?("/root/.chef") }
  recursive true
end

#Knife configuration that node server will use for admin abilities.
template "knife.rb" do
  path "/root/.chef/knife.rb"
  source "knife.rb.erb"
end



#The script that runs on shutdown
template "chef_removal" do
  source "chef_removal.sh.erb"
  path "/etc/init.d/chef_removal.sh"
  owner "root"
  group "root"
  mode 0777
  not_if { File.exist?("/etc/init.d/chef_removal.sh") }
end

#Symlinking script to run level 0 for power off
link "kill_chef_link" do
  target_file "/etc/rc0.d/K01Remove_Chef.sh"
  to "/etc/init.d/chef_removal.sh"
  link_type :symbolic
  owner "root"
  group "root"
end
