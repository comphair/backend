describe Time do
  describe Time.current_total_month do
    it "should return the number of months" do
      date = Time.new
      Time.current_total_month.should == date.year * 12 + date.mon
    end
  end
end