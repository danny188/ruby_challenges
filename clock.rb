class Clock
  def initialize(hour, min)
    @hour = hour
    @min = min
  end

  def self.at(hour = 0, min = 0)
    Clock.new(hour, min)
  end

  def to_s
    format("%02d:%02d", @hour, @min)
  end

  def +(min)
    change_time(min)
  end

  def -(min)
    change_time(-min)
  end

  def ==(another_clock)
    to_s == another_clock.to_s
  end

  private

  def change_time(min)
    new_hour = (@hour + ((@min + min) / 60)) % 24
    new_min = (@min + min) % 60

    Clock.new(new_hour, new_min)
  end
end
