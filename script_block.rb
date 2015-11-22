#!/usr/bin/env ruby

#put test script here

class PrintName
  attr_accessor :name
  def initialize
    yield self if block_given?
  end
  def print_name
    puts @name
  end
end

#obj = PrintName.new
#obj.name = "Charlie"
#obj.print_name
PrintName.new do |x|
  puts x.name
  x.name = "Charlie"
  x.print_name
end
