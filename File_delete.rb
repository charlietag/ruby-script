#!/usr/local/bin/ruby

d = Dir.new '/root'
d.each do |f|
  if f == '\'' # Find filename '
    puts %[Delete file: "#{f}"]
    File.delete f # Delete file named '
  end
end

# FileUtils is also a good way
# Ref. https://ruby-doc.org/stdlib-2.4.1/libdoc/fileutils/rdoc/FileUtils.html
# require 'fileutils'
# FileUtils.rm %w( junk.txt dust.txt )
# FileUtils.rm Dir.glob('*.so')
# FileUtils.rm 'NotExistFile', :force => true   # never raises exception
