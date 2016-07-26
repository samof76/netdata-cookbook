#
# Cookbook Name:: netdata
# Recipe:: netdata_service
#
# Copyright 2016, Sambox LLP
#
# No rights reserved - Do Redistribute



execute "kill netdata" do
  command 'killall netdata'
end

execute "copy service file" do
  command 'cp netdata-lsb /etc/init.d/netdata'
  cwd '/tmp/netdata/system'
end

file '/etc/init.d/netdata' do
  mode '0755'
  owner 'root'
  group 'root'
end

execute "start netdata service" do
  command "service netdata start"
end
