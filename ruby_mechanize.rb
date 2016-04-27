#!/usr/bin/env ruby

require 'mechanize'

agent = Mechanize.new

#page = agent.get('http://www.google.com/')
page = agent.get('https://laravel.com/')

#google_form = page.form('f')
#google_form["q"] = 'ruby mechanize'
#page = mechanize.submit(google_form, google_form.buttons.first)
#p page

#page.links.each do |link|
#    puts link.text
#end

ads = page.link_with(:text => 'Documentation').click
pp ads
