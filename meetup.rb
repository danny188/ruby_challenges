require 'date'

class Meetup
  SCHEDULE_TO_INT = {:first => 1, :second => 2, :third => 3, :fourth => 4}

  def initialize(month, year)
    @first_day_of_input_month = Date.new(year, month, 1)
    @input_month = month
  end

  def day(weekday, schedule)
    test_date = @first_day_of_input_month
    count = 0
    last_weekday_match = nil

    while test_date.month == @input_month
      if weekday_match?(weekday, test_date)
        count += 1

        case schedule
        when :teenth
          return test_date if teenth?(test_date.day)
        when :last
          last_weekday_match = test_date
        else
          return test_date if count == SCHEDULE_TO_INT[schedule]
        end
      end

      return last_weekday_match if schedule == :last &&
                                   test_date == Date.new(test_date.year, test_date.month, -1)

      test_date = test_date.next_day
    end
  end

  def weekday_match?(weekday, date)
    date.send(weekday.to_s + '?')
  end

  def teenth?(day)
    (13..19).include?(day)
  end
end
