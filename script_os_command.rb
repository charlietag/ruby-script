#!/usr/bin/env ruby

def sep_line
  puts "-------------"
  puts "    #{Time.now}"
  puts "-------------"
end


#put test script here
#test_ls = %Q{sleep 10;ls}
test_ls = %Q{ls}

#----------Try Iterator-----------
#call command can just return a string. I have to convert it into array to use iterater (Not IFS like bash)
#Better way here is use Dir built-in Class
result_x_each = %x(#{test_ls})
result_x_each = result_x_each.split(' ') # string into array, split by space. Better use 'Dir'
result_x_each.each do |x|
  puts "File : #{x}"
end
sep_line

#----------%x-------------
result_x = %x(#{test_ls})
puts $? #This identies fork process ID
puts $?.pid
puts $?.exitstatus
puts $$ #This identies main process ID (ruby itself)
# all above is belong to a bash pid (sid-session id), which is your console  or your screen tab, Do not stop program by killing this,
# Kill $$ if need
#puts $0
sep_line

#=================The following fork process==============
#----------exec ----------
# This will not use stdout(Output anyway)
#Notice: this will "exit" after execute the command, not really useful
#result_exec = exec(test_ls)
##Note: this following will never be reached beacuse of the line above
#puts $?
#puts $?.pid
#puts $?.exitstatus
#puts $$
#sep_line

#----------system-------------
#Notice: Just like %w or backticks, But! This will not use stdout(Output anyway), cannot assign it to a var
#But will return true or false to determine if the result is OK
#Not useful as well.
#The result can be replace by exitstatus via %x
result = system(test_ls)
puts result
puts $?
puts $?.pid
puts $?.exitstatus
puts $$
sep_line
