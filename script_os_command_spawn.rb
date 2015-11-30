#!/usr/bin/env ruby

#put test script here

#----------spawn-------------
# Just like bash & <--- background
# return a pid 
puts "============="
puts "  spawn"
puts "============="
result_spawn = spawn("sleep 5; ls")
puts result_spawn

# The following will be nil
puts $? # external PID object
puts $?.pid #external PID
puts $?.exitstatus #external exit
puts $$ #self ruby pid
