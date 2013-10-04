require File.join(File.dirname(__FILE__), '../spec_helper')

describe "Store" do

  describe "validation" do

    it "should create invoice if no invoice at all" do
      store = FactoryGirl.build(:store)
      store.save(validate: false)
      expect(store.invoices).to match_array []
      expect(store.valid?).to be true
      expect(store.invoices.first.timespan).to be Time.current_total_month
    end

  end

end