#!/usr/bin/ruby

class Host
   def initialize(name = nil, ip = nil)
      @hostname = name
      @ip = ip
   end
   attr_reader :hostname, :ip
   attr_writer :hostname, :ip
   def to_s
      "Hostname: #@hostname \nIP Address: #@ip"
   end
end
