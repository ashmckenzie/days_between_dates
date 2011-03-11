require 'active_support'

class DaysBetweenDates

  def report(start, finish)
    @start = start
    @finish = finish

    begin
      process
    rescue Exception => e
      puts "An exception occurred - '#{e.msg}'"
    end

    puts <<-EOS
===========================================
Computing between #{start} and #{finish}
===========================================
- Total days: #{(finish - start).to_i}
- Week days: #{@week_days.length}
- Weekend days: #{@weekend_days.length}
EOS
  end

  private

  def process
    @week_days = (@start..@finish).reject { |d| [0,6].include? d.wday } 
    @weekend_days = (@start..@finish).reject { |d| not [0,6].include? d.wday } 
  end

end
