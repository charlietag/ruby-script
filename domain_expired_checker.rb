#!/usr/local/bin/ruby
require 'date'

#-------------------------
# Config here
#-------------------------
domain_name = [
  "facebook.com",
  "google.com",
  "bing.com"
]

notify_before_days = 30

#-------------------------
# Start to check
#-------------------------
current_time = DateTime.now
err_msg_title = "-----------------------------------------\nThe following domain is going to expired in #{notify_before_days} days:\n-----------------------------------------\n"
err_msg = ""

domain_name.each do |n|
  #cmd = %Q{whois #{n} | grep -Ei 'Expiration|Expires on' | cut -d':' -f2- }
  cmd = %Q{whois #{n} | grep -Ei 'Expiration|Expires on' }
  lookup_dns = %x{#{cmd}}
  #dns_exp_time = DateTime.parse lookup_dns.strip.split(":",2)[1]
  dns_exp_time = DateTime.parse lookup_dns.split(":",2)[1]
  if dns_exp_time < current_time.next_day(notify_before_days)
    err_msg << "#{n} (#{(dns_exp_time - current_time).to_i} days left) : expires at #{dns_exp_time.new_offset(current_time.offset).to_date}"
    err_msg << "\n"
  end
  #duration_days = (dns_exp_time - current_time).to_i
  #puts current_time
  #puts dns_exp_time
  #puts dns_exp_time.new_offset(current_time.offset)
  #puts (dns_exp_time - current_time).to_i
  #puts (dns_exp_time.new_offset(current_time.offset) - current_time).to_i
end

if ! err_msg.empty?
  puts err_msg_title
  puts err_msg
end

