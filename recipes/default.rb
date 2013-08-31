#
# Cookbook Name:: moinmoin
# Recipe:: default
#
# Copyright (C) 2013 YOUR_NAME
# 
# All rights reserved - Do Not Redistribute
#

group node[:moinmoin][:group]

user node[:moinmoin][:user] do
  group node[:moinmoin][:group]
  system true
end

artifact_deploy "moinmoin" do
  version node[:moinmoin][:artifact_version]
  artifact_location node[:moinmoin][:artifact_url]
  deploy_to node[:moinmoin][:deploy_to]
  owner node[:moinmoin][:user]
  group node[:moinmoin][:group]
  action :deploy
end

execute "start moinmoin" do
  base_dir =  "#{node[:moinmoin][:deploy_to]}/current/moin-#{node[:moinmoin][:artifact_version]}"
  server_dir = "#{base_dir}/wiki/server"
  server_command = "moin server standalone --user #{node[:moinmoin][:user]} --group #{node[:moinmoin][:group]} --interface '#{node[:moinmoin][:network_interface]}' --port #{node[:moinmoin][:network_port]} --start"
  command "PYTHONPATH=#{base_dir}:$PYTHONPATH #{server_dir}/#{server_command}"
end
