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
   return config
end
      

file = File.open( "hosts.cfg" )

config = parse_config( file )

myHost = Host.new( config["Servers"]["hostname"], config["Servers"]["ip"] )

puts myHost
file.close
