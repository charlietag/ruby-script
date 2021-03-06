#!/usr/bin/env ruby

require 'mechanize'

def print_sep(name)
  puts "=========================="
  puts "     #{name}"
  puts "=========================="
end

#Same as http://mechanize.rubyforge.org/GUIDE_rdoc.html
print_sep("AGENT")
pp Mechanize::AGENT_ALIASES

print_sep("instance_method - Only Methods")
pp Mechanize.instance_methods

print_sep("instance_method")
pp Mechanize.instance_methods
