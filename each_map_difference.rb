#!/usr/bin/env ruby

#put test script here
puts "======each====="
x = [1]
var = x.each { |x| x*2 }
puts var
#==> 1

puts "======select====="
x = [1]
var = x.select { |x| x*10 }
puts var
#==> 1

puts "======map====="
x = [1]
var = x.map { |x| x*10 }
puts var
#==> 10

puts "======map!====="
x = [1]
var = x.map! { |x| x*10 }
puts var
#==> 10

puts "======collect====="
x = [1]
var = x.collect { |x| x*10 }
puts var
#==> 10


puts "======collect!====="
x = [1]
var = x.collect! { |x| x*10 }
puts var
#==> 10

