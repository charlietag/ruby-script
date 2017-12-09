#!/usr/local/bin/ruby
require "erb"

class Render
  #attr_accessor :name, :file
  def initialize(name = "", file = __FILE__)
    @name = name
    @file = file
  end

  def render
    template = IO.read @file
    render = ERB.new template
    render.result binding #Add binding method for pass instance var into template
  end
end
template_file = "script_erb.template"

output = Render.new "Charlie",template_file
puts output.render

name = "haha"
output1 = Render.new name,template_file
puts output1.render
puts output.render


#----------------------------------------
# Using without class
#----------------------------------------
template_file = "script_erb.template"
template = IO.read template_file
render3 = ERB.new template

name = "output3"
output3 = render3.result
puts output1.render
puts output.render
puts output3

#----------------------------------------
# This link would solve the binding confused issue
# http://www.stuartellis.eu/articles/erb/#a-longer-example
# http://blog.revathskumar.com/2014/10/ruby-rendering-erb-template.html
#----------------------------------------
