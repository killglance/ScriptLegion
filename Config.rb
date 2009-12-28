#!/usr/bin/ruby

class ConfigParser
   @@default_files = "hosts.cfg"
   def parse_config( cfg_file = @@default_files )
      file = File.open("#{cfg_file}")
      config = {}
      while file.gets do
         if $_.match /\[(.+?)\]/
            insert_point = $1
            config[insert_point] = {}
         elsif $_.match /(.+?)=(.+)/
            config[insert_point][$1.strip] = $2.strip
         end
      end
      file.close
      return config
   end
end
