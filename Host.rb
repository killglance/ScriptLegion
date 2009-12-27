#!/usr/bin/ruby

require 'net/ssh'

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
   def send_cmd(command)
      Net::SSH.start(@ip, 'root') { |session| return session.exec!(command) }
   end 
   def service(svc, action)
      Net::SSH.start(@ip, 'root') { |session| return session.exec!"/sbin/service #{svc} #{action}" }
   end
   def service_running?(svc)
      Net::SSH.start(@ip, 'root') do |session|
         return true if session.exec!("/sbin/service #{svc} status").match("running")
      end
   end
end
