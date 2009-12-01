#!/usr/bin/ruby

require "Host.rb"

file = File.open( "hosts.cfg" )

config = {}
config["globals"] = {}
insert_point = "globals"

while file.gets do
  if $_.match /\[(.+?)\]/
    insert_point = $1
    config[insert_point] = {}
  elsif $_.match /(.+?)=(.+)/
    config[insert_point][$1.strip] = $2.strip
  end
end

myHost = Host.new( config["ThisHost"]["hostname"], config["ThisHost"]["ip"] )
#myHost = Host.new("localhost", "127.0.0.1")

puts myHost
