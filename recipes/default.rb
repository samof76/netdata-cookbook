#
# Cookbook Name:: netdata
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
execute "update" do
  command "apt-get update"
  action :run
end

include_recipe "netdata::netdata"
include_recipe "netdata::netdata_service"
