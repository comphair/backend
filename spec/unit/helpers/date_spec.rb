describe Time do
  describe Time.current_total_month do
    it "should return the number of months" do
      date = Time.new
      expect(Time.current_total_month).to be date.year * 12 + date.mon
    end
  end
end