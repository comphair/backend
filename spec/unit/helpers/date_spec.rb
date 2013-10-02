describe Date do
  describe Date.current_total_month do
    it "should return the number of months" do
      date = Date.new
      Date.current_total_month.should == date.year * 12 + date.mon
    end
  end
end