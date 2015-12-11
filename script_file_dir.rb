#!/usr/bin/env ruby

require 'optparse'

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

  def file_attr
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

  def dir_attr
    puts Dir.pwd
    file_dir = File.dirname(@file)
    Dir.entries(file_dir).each do |x|
      real_file = file_dir + '/' + x

      #cannot use File.exist in if statement here, it will display . and .. because File.exist doesn't check if it's a file or not
      #PS. dir.exist checks if it's a directory...
      puts "FILENAME: #{file_dir} : #{x}" if File.file?(real_file)
    end
  end
    
end


options = Hash.new
OptionParser.new do |opt|
  opt.on("-h", "--help", "Show this help") do |v|
    puts opt
  end
  opt.on("-v", "--[no-]verbose", "Run verbosely") do |v|
    options[:verbose] = v
  end
  
  opt.on("-f name", "--file name", "Specify filename") do |v|
    options[:filename] = v
  end
  opt.on("-a action", "Action") do |v|
    options[:action] = v
  end
end.parse!


options[:filename] = __FILE__ if options[:filename].nil?

if ! options[:filename].nil?
  MyFile.new(options[:filename]) do |f|
    case options[:action]
    when 'dir_attr'
      f.dir_attr
    else
      f.file_attr
      f.print_sep
    end
  end
end
