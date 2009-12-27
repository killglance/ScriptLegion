#!/usr/bin/ruby

require "Host.rb"

def parse_config( my_file )
   config = {}
   while my_file.gets do
      if $_.match /\[(.+?)\]/
         insert_point = $1
         config[insert_point] = {}
      elsif $_.match /(.+?)=(.+)/
         config[insert_point][$1.strip] = $2.strip
      end
   end
   my_file.close
   return config
end
      

file = File.open( "hosts.cfg" )
grid = Array.new
config = parse_config( file )
config.each { |key,value| if value["type"] = "server" then grid << Host.new( key, value["ip"] ) end }

#puts "Start Pings on #{grid[1].ip}"
#grid.each { |f| puts %x{ping -c 5 #{f.ip}} }

grid.each do |node| 
   #puts node.send_cmd("ls /root") if node.hostname == "fedora"
   node.service("httpd", "start") if node.hostname == "fedora"
   #puts node.send_cmd("ps -ef") if node.hostname == "fedora"
   #node.stop_service("httpd") if node.hostname == "fedora"
   node.service("httpd","stop") if node.service_running?("httpd") if node.hostname == "fedora"
end
