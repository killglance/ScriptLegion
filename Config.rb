#!/usr/bin/ruby

class Config
#   @@default_files = "hosts.cfg"
#   def initialize()
#   end
   def initialize()
      @stuff = 0
   end
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
end
