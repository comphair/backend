require File.join(File.dirname(__FILE__), '../spec_helper')

describe "Store" do

  describe "validation" do

    it "should create invoice if no invoice at all" do
      store = Store.new title: "Test", description: "Test"
      store.save(validate: false)
      store.build_address
      store.build_schedule
      store.invoices.should == []
      store.save!
      store.invoices.first.timespan.should == Time.current_total_month
    end

  end

end