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

puts %{*********Whole Origin data With IO.readlines method**********}
content = IO.readlines(filename)
p content
# or equal
content.each do |x|
  puts x
end
puts %{*********Whole Origin data With IO.readlines method**********}

puts %{*********Whole Origin data With File.read method**********}
content = IO.readlines(filename)
p content
puts %{*********Whole Origin data With File.read method**********}
