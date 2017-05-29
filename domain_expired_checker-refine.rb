#!/usr/local/bin/ruby
#rpm package required:jwhois
#yum install jwhois
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
  #--command--
  cmd = %Q{whois #{n} | grep -Ei 'Expiration|Expires on' }
  lookup_dns = %x{#{cmd}}

  #--result--
  dns_exp_time = DateTime.parse lookup_dns.split(":",2)[1]
  if dns_exp_time < current_time.next_day(notify_before_days)

    exp_days = (dns_exp_time - current_time).to_i
    exp_date = dns_exp_time.new_offset(current_time.offset).to_date

    #--err msg--
    err_msg << "#{n} (#{exp_days} days left) : expires at #{exp_date}"
    err_msg << "\n"
  end
end

#-------------------------
# Output if error occurs
#-------------------------
if ! err_msg.empty?
  puts err_msg_title
  puts err_msg
end

