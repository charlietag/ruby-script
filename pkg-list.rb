#!/usr/local/bin/ruby

filename = %Q[pkg-list.txt]
File.open(filename,'r') do |f|
  f.each do |line|
    line.split(' ').each do |word|
      puts "========================="
      puts word
      puts "========================="
      pkg_name = %x(rpm -q "#{word}")
      puts pkg_name
      puts "\n\n"
    end
  end
end
