#!/usr/local/bin/ruby
file_name = File.dirname(File.realpath __FILE__) + %Q[/version.txt]
File.open(file_name,"a") do |f|
  content = ""
  content << %Q[-------------------------------------]
  content << %Q[\n]
  content << Time.new.strftime(%Q[%Y-%m-%d %H:%M:%S])
  content << %Q[\n]
  content << %Q[-------------------------------------]
  content << %Q[\n]
  content << RUBY_VERSION
  content << %Q[\n]
  content << %Q[\n]
  f.puts content
end

