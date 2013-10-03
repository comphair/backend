require File.join(File.dirname(__FILE__), '../spec_helper')

describe "Store" do

  describe "validation" do

    it "should create invoice if no invoice at all" do
      store = FactoryGirl.build(:store)
      store.save(validate: false)
      store.invoices.should == []
      store.valid?.should == true
      store.invoices.first.timespan.should == Time.current_total_month
    end

  end

end