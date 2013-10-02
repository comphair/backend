class Time
  def self.current_total_month
    self.now.year * 12 + self.now.mon
  end
end