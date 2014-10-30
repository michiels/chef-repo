#
# Cookbook Name:: docker-applications
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

include_recipe "docker"

if node[:docker_applications]

	node[:docker_applications].each do |name, docker_info|
		docker_image docker_info['image']

		docker_container docker_info['image'] do
			detach true
			container_name name
			env docker_info['env_vars']
			port docker_info['ports']
			link docker_info['links']
		end
	end

end