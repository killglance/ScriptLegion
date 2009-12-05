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

puts grid
