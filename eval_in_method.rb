#!/usr/bin/env ruby
# Ref. https://stackoverflow.com/questions/6776162/replace-variable-with-its-value-in-a-ruby-string-string-itself-is-stored-in-a-v/20713324

def ask_quest(question,answer)

  puts question
  ans = gets
  ans = ans.chomp
  print "A: "


  # ------------------------
  # This works
  # ------------------------
  puts eval('"'+ answer +'"')
  puts ""

  # ------------------------
  # Error
  # ------------------------
  # puts eval("answer")

  # ------------------------
  # OR this works
  # ------------------------
  # answer = '"' + answer + '"'
  # puts eval("#{answer}")

end




ask_quest "What is your name ?", 'Hi, #{ans}'
ask_quest "How old are you?", 'Wow! you are #{ans}'

# -------------------------------------------------------------
# Sample 1
# -------------------------------------------------------------
# my_string = "Congrats you have joined groupName."
# groupName = "*Name of my group*"
# puts my_string.gsub('groupName',groupName)

# -------------------------------------------------------------
# Sample 2
# -------------------------------------------------------------
# 2.0.0-p247 :034 > a = "I love my live, says %{who}"
#  => "I love my live, says %{who}"
# 2.0.0-p247 :035 > a % { :who => "me" }
#  => "I love my live, says me"
