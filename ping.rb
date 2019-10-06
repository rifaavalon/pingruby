#!/usr/bin/env ruby

require 'net/ping'
require 'socket'
require 'rubygems'
require 'twilio-ruby'

@getip = Socket.getifaddrs.map { |i| i.addr.ip_address if i.addr.ipv4? }.compact

account_sid = ''
auth_token = ''

def up?(host)
  check = Net::Ping::External.new(host)
  check.ping?
end

chost = 'www.google.com'

rtary = []
fails = 0
repeat = 5

@icmp = Net::Ping::External.new(chost)

puts 'starting to ping'
(1..repeat).each do

	if @icmp.ping
		rtary << @icmp.duration
		puts "host replied in #{@icmp.duration}"
	else
		fails += 1
		puts "timeout"
	end
end
avg = rtary.inject(0) {|sum, i| sum + i}/(repeat - fails)


@client = Twilio::REST::Client.new(account_sid, auth_token)
from = 'yourtrialnumber'
to = 'yourphonenumber'

message = @client.messages
  .create(
    body: "Here is the ip for your computer: '#{@getip}' Google Ping Average: '#{avg}\n' Failed Packets:#{fails} ",
    from: from,
    to: to
  )

  puts message.sid
