describe Placekeeper do

  describe "session key" do

    it "should generate a session key after initializing" do
      placekeeper = Placekeeper.new
      expect(placekeeper.session_key).to match /[0-9,a-f]{8}-[0-9,a-f]{4}-[0-9,a-f]{4}-[0-9,a-f]{4}-[0-9,a-f]{12}/
    end

  end

end