#
# Cookbook Name:: application
# Recipe:: default
#
#
# All rights reserved - Do Not Redistribute
#
# Author:: Ishag Alexanian <ishagalexanian@gmail.com>
#
#


# Installing on Windows  
case node['platform'] 
when "windows"
  Chef::Log.warn("*********  Run Command prompt as administrator to run chef-client on Windows  *********")	
  
  package = node['applicaton']
  remote_file package['name'] do
    source  package['source']
    not_if  {File.exists?(package['name'])}
  end 

end
