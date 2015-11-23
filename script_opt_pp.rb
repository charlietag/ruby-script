#!/usr/bin/env ruby

#put test script here
require 'optparse'
require 'ostruct'
require 'pp'

ostruct = OpenStruct
data = ostruct.new
#data = Hash.new

opt_parser = OptionParser.new do |opts|
  opts.on("-n","--name [name]",String,"Put your name here") do |n|
    #data[:name] = n
    data.name = n
  end

  opts.on("-a","--age [age]", Integer,"What's your age") do |a|
    #data[:age] = a
    data.age = a
  end

  opts.on("--tall [height]",Integer,"How tall are you") do |e|
    #data[:height] = e
    data.height = e
  end

  opts.separator ""
  opts.separator "Help Options:"

  opts.on("-h","--help","Show this message") do
    puts opts
    exit
  end
end
opt_parser.parse!
puts "My name is #{data.name}. I'm #{data.age} years old. I'm in #{data.height} height."
pp data
