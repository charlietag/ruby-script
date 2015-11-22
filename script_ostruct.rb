#!/usr/bin/env ruby

#put test script here
#class MyAttr
#  attr_accessor :name
#  attr_accessor :age
#  #def initialize(name,age)
#  #  @name = name
#  #  @age = age
#  #end
#end
#
##obj = MyAttr.new("charlie",18)
#obj = MyAttr.new
require 'ostruct'
obj_struct = OpenStruct
obj = obj_struct.new
puts obj.name
obj.name = "Ha"
puts obj.name
