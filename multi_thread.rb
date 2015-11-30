#!/usr/bin/env ruby

#put test script here
#!/usr/bin/ruby
def func1
  3.times do |i|
    puts "***func1 at (#{i}): #{Time.now}"
    sleep(10)
  end
end

def func2
  5.times do |i|
    puts "---func2 at (#{i}): #{Time.now}"
    sleep(5)
  end
end

puts "---------Started At #{Time.now}-------"
#t1=Thread.new{func1()}
#t2=Thread.new{func2()}
#t1.join
#t2.join
thread = []
thread << Thread.new {func1()}
thread << Thread.new {func2()}
thread.each do |thr|
  thr.join #xxx.join means wait for the execution, or it will terminate immediately
  puts thr.status
end
puts "---------End at #{Time.now}--------"


#Result of above
#---------Started At 2015-11-30 23:54:02 +0800-------
#---func2 at (0): 2015-11-30 23:54:02 +0800
#***func1 at (0): 2015-11-30 23:54:02 +0800
#---func2 at (1): 2015-11-30 23:54:07 +0800
#***func1 at (1): 2015-11-30 23:54:12 +0800
#---func2 at (2): 2015-11-30 23:54:12 +0800
#---func2 at (3): 2015-11-30 23:54:17 +0800
#***func1 at (2): 2015-11-30 23:54:22 +0800
#---func2 at (4): 2015-11-30 23:54:22 +0800
#false
#false
#---------End at 2015-11-30 23:54:32 +0800--------
