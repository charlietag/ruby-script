#!/usr/local/bin/ruby
filename = %[useradd_mass_text.txt]
File.open(filename,'r') do |f|
  puts f
  puts "........................."
  f.each do |line|
    puts %{*********Whole Origin data**********}
    puts line
    puts %{*********Whole Origin data**********}
    puts ""

    puts %{*********Split data with space**********}
    line.split(' ').each do |x|
      puts x
    end
    puts %{*********Split data with space**********}
    puts ""
  end
end

puts %{*********Whole Origin data With File.read method**********}
content = IO.readlines(filename)
puts content
# or equal
content.each do |x|
  puts x
end
puts %{*********Whole Origin data With File.read method**********}
