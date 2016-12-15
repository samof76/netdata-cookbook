#
# Cookbook Name:: netdata
# Recipe:: default
#
# Copyright 2016, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
case node['platform_family']
when 'rhel', 'fedora'
  package 'epel-release' do
    action :install
  end
  execute 'repo update' do
    command 'yum update -y'
    action :run
  end
when 'ubuntu', 'debian'
  execute "update" do
    command "apt-get update"
    action :run
  end
end

include_recipe "netdata::netdata"
include_recipe "netdata::netdata_service"
