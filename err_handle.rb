#!/usr/bin/env ruby

#put test script here

command = %(ls xx)
begin
  error
#puts result_ls
rescue
  puts $! 
  puts $@ 
end
error
