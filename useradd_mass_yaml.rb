#!/usr/local/bin/ruby
require 'yaml'

filename = File.basename(__FILE__,'.*') + ".yml"

info ||= YAML.load_file(filename)

info.each do |l|
  puts "--------------------#{l['username']}------------------------"
  puts "useradd ..."
  %x(id #{l['username']} || useradd #{l['username']})
  exit if $?.exitstatus != 0

  puts "passwd ..."
  puts %x(echo #{l['password']} | passwd --stdin #{l['username']} )
  exit if $?.exitstatus != 0
  
  puts ""

end
