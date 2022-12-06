#!/usr/bin/env ruby
decimal = /^-?([1-9][0-9']*|0){1}(?<=[0-9]).(?=[0-9])[0-9']*[0-9]$/

ok = ["1.0","-1.0","0.0","329'124.038238"]
not_ok = ["001.0","123..123","22'.123","123.123.32"]

puts "ok"
ok.each { |addr| raise "#{addr} should match decimal" unless (addr =~ decimal) }

puts "not_ok"
not_ok.each { |addr| raise "#{addr} should not match decimal" unless not (addr =~ decimal) }

