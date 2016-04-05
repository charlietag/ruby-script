#!/usr/local/bin/ruby
f = File.open(__FILE__, 'r')
if ! f.flock(File::LOCK_EX | File::LOCK_NB)
  puts "Another instance is already running"
  exit
end
puts "Running #{$$}"
sleep 10
