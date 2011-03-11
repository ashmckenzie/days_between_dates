#!/usr/bin/env ruby

require 'rubygems'
require 'trollop'
require 'lib/days_between_dates'

opts = Trollop::options do
  banner <<-EOS
Determine the number of days, work days and weekend days between two dates.

EOS

  opt :help, 'Help', :short => 'h'
  opt :start, "Start date in the format of YYYY/MM/DD", :type => String, :short => 's', :required => true
  opt :end, "End date in the format of YYYY/MM/DD", :type => String, :short => 'e', :required => true
end

raise OptionParser::InvalidArgument if not opts[:start].match(/\d\d\d\d\/\d\d\/\d\d/)
raise OptionParser::InvalidArgument if not opts[:end].match(/\d\d\d\d\/\d\d\/\d\d/)

d = DaysBetweenDates.new
d.report(Date.parse(opts[:start]), Date.parse(opts[:end]))
