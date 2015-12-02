#!/usr/bin/env ruby

#Print out all the attribute of the given file
class MyFile
  def initialize(file)
    if File.file?(file)
      @file = file
      yield self if block_given?
    else
      # exit in ruby
      puts "File doesn't exist!"
      Process.exit(0)
    end
  end

  def print_file_attr
    file_attr = ""
    file_attr << "---absolute_path---" 
    file_attr << %(\n)
    file_attr << File.absolute_path(@file)
    file_attr << %(\n)
    file_attr << %(\n)

    file_attr << "---dirname---"
    file_attr << %(\n)
    file_attr << File.dirname(@file)
    file_attr << %(\n)
    file_attr << %(\n)

    file_attr << "---realpath---"
    file_attr << %(\n)
    file_attr << File.realpath(@file)
    file_attr << %(\n)
    file_attr << %(\n)
    
    file_attr << "---path---"
    file_attr << %(\n)
    file_attr << File.path(@file)
    file_attr << %(\n)
    file_attr << %(\n)

    file_attr << "---basename---"
    file_attr << %(\n)
    file_attr << File.basename(@file)
    file_attr << %(\n)

    file_attr << "---extname---"
    file_attr << %(\n)
    file_attr << File.extname(@file)
    file_attr << %(\n)

    puts file_attr
  end

  def print_sep
    sep = "===================="
    puts sep
  end
  def print_dir_attr
    dir_attr = ""
  end
    
end



file = __FILE__
#file = "a"
MyFile.new(file) do |f|
  f.print_file_attr
  f.print_sep
  f.print_dir_attr
end
