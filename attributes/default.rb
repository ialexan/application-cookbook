#
# Cookbook Name:: application
# Recipe:: default
#
#
#
#

case node['platform'] 
when "windows"
  default['applicaton'] =  
    { "name" => "wordpress",
      "version" => "3.7.1", 
      "source" => "http://wordpress.org/latest.zip",     
      "deploy" => "false"
    } 
end
 