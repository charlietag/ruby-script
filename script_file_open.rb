#!/usr/bin/env ruby
file_name = "haha"

#warning: File::new() does not take block; use File::open() instead
#File.new(file_name,"w") do |f|
File.open(file_name,"w") do |f|
  puts f
end
