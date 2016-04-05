#!/usr/local/bin/ruby
filename = %[README.md]
File.open(filename,'r') do |f|
  f.each do |line|
    #--just output line by line
    #puts line
    
    #-- or seperator by space ---
    line.split(' ').each do |x|
      puts x
    end
  end
end
