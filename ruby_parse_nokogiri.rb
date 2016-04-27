#!/usr/bin/env ruby
require 'nokogiri'
require 'open-uri'
page = Nokogiri::HTML(open("http://url.here")) do |c|
  c.strict.nonet.noblanks
end

now_time = Time.now
target = Hash.new()


#Sample, using css selection
content = page.css('.text-2')

content.each do |c|
  #CSS selector sample => target[:id] = c.css('a[href^="http://"]').text
  target[:id] = c.css('a').attr('href').to_s.split('/')[4]
  target[:name] = c.css('td[2]').text
  #Wrong Way => target[:score] = c.css('a[href^="http://"]+td').text
  target[:score] = c.css('td[3]').text
  
  if !target[:name].empty?
    puts "#{now_time}.#{target[:id]},#{target[:name]},#{target[:score]}"
  end
end
