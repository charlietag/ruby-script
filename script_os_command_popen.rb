#!/usr/bin/env ruby

#put test script here
require 'open3'
#Open3.popen3("ls x") do |i,o,e,t| 
#  #puts "--stdout--"
#  #p o.readline
#  #puts "--stderr--"
#  p o.readline + e.readline
#end

#f = open('|ls x')
##p f.readlines

sin, sout, serr = Open3.popen3('ls x')
#p serr.readlines
p sin.class
p serr.class
