#!/usr/local/bin/ruby
filename = File.basename(__FILE__,'.*') + ".txt"

File.open(filename,'r').each do |l|
  username,password = l.split(':')
  password.strip!

  puts %x(id #{username} || useradd #{username})
  puts %x(echo #{password} | passwd --stdin #{username} )
end
