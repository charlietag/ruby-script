#!/usr/bin/env ruby
#https://ruby-china.org/wiki/building-a-command-line-tool-with-optionparser
#put test script here
require 'optparse'
options = {}
OptionParser.new do |opts|
  opts.banner = "Usage: example.rb [options]"

  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = true
  end
end.parse!

p options
p ARGV
