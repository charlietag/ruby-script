#!/usr/local/bin/ruby
require "erb"

class Render
  #attr_accessor :name, :file
  def initialize(config = {}, file = __FILE__)
    @config = config
    @file = file
  end

  def render
    template = IO.read @file
    render = ERB.new template
    render.result binding #Add binding method for pass instance var into template
  end
end
template_file = "script_erb.template"

config = {
  name: "Charlie"
}
output = Render.new config,template_file
puts "First call : " + output.render

config[:name] = "haha"
output1 = Render.new config,template_file
puts "Second call : " + output1.render
puts "Third call : " + output.render

#----------------------------------------
# Result of above
#----------------------------------------
# ./script_erb.rb
#First call :
#Charlie #===> using instance var and Hash with binding method

#Second call :
#haha #===> using instance var and Hash with binding method

#Third call :
#haha #===> using instance var and Hash with binding method


#----------------------------------------
# Using without class
# Comment the following because template is using Hash instance var, not local var
#----------------------------------------
#template_file = "script_erb.template"
#template = IO.read template_file
#render3 = ERB.new template

#name = "output3"
#output3 = render3.result
#puts output1.render
#puts output.render
#puts output3

#----------------------------------------
# This link would solve the binding confused issue
# http://www.stuartellis.eu/articles/erb/#a-longer-example
# http://blog.revathskumar.com/2014/10/ruby-rendering-erb-template.html
#----------------------------------------
