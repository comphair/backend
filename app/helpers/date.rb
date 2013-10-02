class Date
  def self.current_total_month
    date = self.new
    date.year * 12 + date.mon
  end
end