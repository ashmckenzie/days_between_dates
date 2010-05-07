#!/usr/bin/env ruby

require 'rubygems'
require 'optparse'
require 'activesupport'

options = {}

OptionParser.new do |o|

  script_name = File.basename($0)

  o.banner =    "Usage: #{script_name} [options]"
  o.define_head 'Determine the number of days, work days and weekend days between two dates'
  o.separator   ''
  o.separator   'Mandatory arguments to long options are mandatory for short options too.'

  o.on('-s', '--start YYYY/MM/DD', 'Start date in the format of YYYY/MM/DD') do |f|
    options[:start] = f
  end

  o.on('-e', '--end YYYY/MM/DD', 'End date in the format of YYYY/MM/DD') do |f|
    options[:end] = f
  end

  o.on('-h', '--help', "Show this help message") do |f|
    puts o
    exit
  end

  o.parse!

end

raise OptionParser::MissingArgument if options[:start].nil?
raise OptionParser::MissingArgument if options[:end].nil?

raise OptionParser::InvalidArgument if not options[:start].match(/\d\d\d\d\/\d\d\/\d\d/)
raise OptionParser::InvalidArgument if not options[:end].match(/\d\d\d\d\/\d\d\/\d\d/)

start_date = Date.parse(options[:start])
end_date = Date.parse(options[:end])

week_days = (start_date..end_date).reject { |d| [0,6].include? d.wday } 
weekend_days = (start_date..end_date).reject { |d| not [0,6].include? d.wday } 

puts
puts "Computing between #{options[:start]} and #{options[:end]}\n\n"
puts "- Total days #{(end_date - start_date).to_i}"
puts "- Week days #{week_days.length}"
puts "- Weekend days #{weekend_days.length}"
puts
