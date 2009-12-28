#!/usr/bin/ruby

require "Host.rb"
require "config.rb"

grid = Array.new
parser = ConfigParser.new
config = parser.parse_config
config.each { |key,value| if value["type"] = "server" then grid << Host.new( key, value["ip"] ) end }

grid.each do |f| 
   puts "Start Pings on #{f.ip}"
   puts %x{ping -c 5 #{f.ip}}
end

grid.each do |node| 
   #puts node.send_cmd("ls /root") if node.hostname == "fedora"
   puts node.service("httpd", "start") if node.hostname == "fedora"
   #puts node.send_cmd("ps -ef") if node.hostname == "fedora"
   #node.stop_service("httpd") if node.hostname == "fedora"
   puts node.service("httpd","stop") if node.service_running?("httpd") if node.hostname == "fedora"
end
