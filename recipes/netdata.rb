#
# Cookbook Name:: netdata
# Recipe:: netdata
#
# Copyright 2016, Sambox LLP
#
# No rights reserved - Do Redistribute

['zlib1g-dev', 'uuid-dev', 'libmnl-dev', 'gcc', 'make', 'git', 'curl', 'jq', 'nodejs', 'autoconf', 'autoconf-archive', 'autogen', 'automake', 'pkg-config'].each {
  |item| package item do
    action :install
  end
}

git '/tmp/netdata' do
  repository 'https://github.com/firehol/netdata.git'
  depth 1
  revision 'master'
  action :sync
end

execute "install script" do
  command './netdata-installer.sh --dont-wait'
  cwd '/tmp/netdata'
end
